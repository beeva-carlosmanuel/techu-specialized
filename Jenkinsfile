#!groovy

globalrepoBranch="master"

stage('Checkout Global Library') {
    def cells_ci, cells_node_label
    node {
      cells_node_label = "${env.cells_node_label}"
      globalrepo = "${env.globalrepo}"
      globalrepo_credentials_id="${env.globalrepo_credentials_id}"
    }
    def repoParams = [
        "mailStatus" : ["SUCCESS", "FAILURE", "UNSTABLE", "WARNING"],
        "piscoOpts" : [
            "s3Uploads": [
                [
                    "id": "codelabs-landing-page",
                    "remoteDir" : "cells/codelabs",
                    "bucket": "bbva-files",
                    "region": "eu-west-1",
                    "key": "{jenkins.TEST_AWS_ACCESS_KEY_ID}",
                    "password": "{jenkins.TEST_AWS_SECRET_ACCESS_KEY}"
                 ]
			]
        ]
    ];

    fileLoader.withGit(globalrepo, globalrepoBranch, globalrepo_credentials_id, cells_node_label) {
        cells_ci = fileLoader.load('src/cells/ci/ci');
        cells_ci.cells_ci_flow(repoParams)
    }
}