local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-bluechi') {
  settings+: {
    dependabot_security_updates_enabled_for_new_repositories: false,
    description: "",
    members_can_change_project_visibility: false,
    name: "Eclipse Bluechi project",
    packages_containers_internal: false,
    packages_containers_public: false,
    readers_can_create_discussions: true,
    two_factor_requirement: false,
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('bluechi') {
      allow_update_branch: false,
      description: "Bluechi is a systemd service controller intended for multi-node environments with a predefined number of nodes and with a focus on highly regulated ecosystems such as those requiring functional safety.",
      has_projects: false,
      has_wiki: false,
      homepage: "https://bluechi.readthedocs.io/en/latest/",
      secret_scanning: "disabled",
      secret_scanning_push_protection: "disabled",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "containers",
        "controller",
        "linux",
        "podman",
        "services",
        "systemd"
      ],
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      webhooks: [
        orgs.newRepoWebhook('https://apps.fedoraproject.org/github2fedmsg/webhook') {
          content_type: "json",
          events+: [
            "*"
          ],
          secret: "********",
        },
        orgs.newRepoWebhook('https://copr.fedorainfracloud.org/webhooks/github/82383/cc6b5f40-adf7-4168-a023-b500bfb8281a/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/hirte/237871/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://$token:9Z6454N86GYYWDEX9NWUM4IIRIPLNZFDUJL7Y065NJUAF8BXTTEF68R6RHQ21OYL@quay.io/webhooks/push/trigger/55ae23b1-a5d6-44e3-98f7-82f660ce0225') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://$token:9JM66KEJKAM6ZVN2QJR8AYZ4IRUCH0HHS0WWTR1FKGEV8SZV7V55X5YULB702OKU@quay.io/webhooks/push/trigger/e3df6d15-a8ff-4810-ad21-c23c180004f7') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/bluechi/247263/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://copr.fedorainfracloud.org/webhooks/github/102833/ac79d20a-773d-40cd-b6a2-2d1c4df747b2/') {
          content_type: "json",
          events+: [
            "push"
          ],
        },
      ],
      secrets: [
        orgs.newRepoSecret('GH_RELEASE_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('PYPI_API_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          required_status_checks+: [
            "rpmbuild",
            "test"
          ],
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
        orgs.newBranchProtectionRule('hirte*') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('hashmap.c') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "hashmap.c",
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
    },
  ],
}
