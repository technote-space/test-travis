#!/usr/bin/env bash

set -e

echo ""
echo WP_TAG: ${WP_TAG}
echo TRAVIS_TAG: ${TRAVIS_TAG}
echo SVN_COMMIT_MESSAGE: ${SVN_COMMIT_MESSAGE}
echo SVN_TAG_MESSAGE: ${SVN_TAG_MESSAGE}

TAGS=($(git for-each-ref --sort=-taggerdate --format='%(tag)' refs/tags))

echo ""
echo "tag count:"
echo ${#TAGS[@]}

if [[ ${#TAGS[@]} -lt 2 ]]; then
	COMMIT_RANGE=${TRAVIS_COMMIT}...$(git log -1 --format=format:"%H" ${TAGS[1]})
else
	COMMIT_RANGE=${TRAVIS_COMMIT}...$(git rev-list --max-parents=0 HEAD)
fi

echo ${COMMIT_RANGE}

echo ""
echo "commits"
LOGS=$(git log ${COMMIT_RANGE} --no-merges --oneline)
COMMIT_MESSAGE=$'**Change log:**<br/>'${LOGS//$'\n'/<br/>}
echo ${COMMIT_MESSAGE}
echo ""

bash ${TRAVIS_BUILD_DIR}/tests/bin/deploy/prepare_svn.sh

if [[ ! -d ${SVN_DIR} ]]; then
	exit;
fi

if [[ -z "${SVN_USER}" ]] || [[ -z "${SVN_PASS}" ]]; then
	echo "<SVN_USER>, <SVN_PASS> are required."
	exit 1
fi

pushd ${SVN_DIR}

echo ""
echo ">> Run svn st."
svn st

echo ""
echo ">> Run svn commit."
svn commit -m ${SVN_COMMIT_MESSAGE} --username ${SVN_USER} --password ${SVN_PASS} --non-interactive 2>/dev/null

echo ""
echo ">> Check if tag exist."
if [[ -z $(svn ls ${SVN_URL}/tags | grep "^${WP_TAG}/$") ]]; then
	echo "tags/${WP_TAG} not exists."
	echo ""
	echo ">> Run svn copy."
	svn copy ${REPO_NAME}/trunk ${REPO_NAME}/tags/${WP_TAG} -m ${SVN_TAG_MESSAGE} --username ${SVN_USER} --password ${SVN_PASS} --non-interactive 2>/dev/null
else
	echo "tags/${WP_TAG} already exists."
fi

pushd

bash ${TRAVIS_BUILD_DIR}/tests/bin/deploy/clear_work_dir.sh
