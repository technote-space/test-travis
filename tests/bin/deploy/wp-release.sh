#!/usr/bin/env bash

set -e

echo TRAVIS_EVENT_TYPE: ${TRAVIS_EVENT_TYPE}
echo TRAVIS_COMMIT: ${TRAVIS_COMMIT}
echo TRAVIS_COMMIT_RANGE: ${TRAVIS_COMMIT_RANGE}
echo TRAVIS_PULL_REQUEST: ${TRAVIS_PULL_REQUEST}
echo TRAVIS_PULL_REQUEST_BRANCH: ${TRAVIS_PULL_REQUEST_BRANCH}
echo TRAVIS_PULL_REQUEST_SHA: ${TRAVIS_PULL_REQUEST_SHA}
echo TRAVIS_PULL_REQUEST_SLUG: ${TRAVIS_PULL_REQUEST_SLUG}
echo TRAVIS_REPO_SLUG: ${TRAVIS_REPO_SLUG}
echo TRAVIS_REPO_SLUG: ${TRAVIS_REPO_SLUG}
echo TRAVIS_TAG: ${TRAVIS_TAG}
echo ""
echo WP_TAG: ${WP_TAG}
echo TRAVIS_TAG: ${TRAVIS_TAG}
echo SVN_COMMIT_MESSAGE: ${SVN_COMMIT_MESSAGE}
echo SVN_TAG_MESSAGE: ${SVN_TAG_MESSAGE}

TAGS=($(git for-each-ref --sort=-taggerdate --format='%(tag)' refs/tags))

echo ""
echo "tag count:"
echo ${#TAGS[@]}

if [[ ! ${TRAVIS_COMMIT_RANGE} =~ \.\.\. ]]; then
	if [[ ${#TAGS[@]} = 0 ]]; then
		echo "tag not exists."
		PARENTS=$(git log -n 1 --format="%P" ${TRAVIS_COMMIT_RANGE})
		TRAVIS_COMMIT_RANGE=${TRAVIS_COMMIT_RANGE}...${PARENTS%% *}
	else
		[[ ${TRAVIS_TAG} = ${TAGS[0]} ]] && LAST_TAG=${TAGS[1]} || LAST_TAG=${TAGS[0]}
		echo ""
		echo "last tag: "
		echo ${TAGS[0]}
		git show ${LAST_TAG}
		TRAVIS_COMMIT_RANGE=${TRAVIS_COMMIT_RANGE}...$(git log -1 --format=format:"%H" ${LAST_TAG})
	fi
fi

echo ${TRAVIS_COMMIT_RANGE}

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
