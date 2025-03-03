local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('automotive.bluechi', 'eclipse-bluechi') {
  settings+: {
    description: "",
    name: "Eclipse Bluechi project",
    packages_containers_internal: false,
    packages_containers_public: false,
    web_commit_signoff_required: false,
  },
  secrets+: [
    orgs.newOrgSecret('ANSIBLE_GALAXY_API_TOKEN') {
      value: "pass:bots/automotive.bluechi/galaxy.ansible.com/api-token",
    },
  ],
  webhooks+: [
    orgs.newOrgWebhook('https://webhook.fedoraproject.org/api/v1/messages/f424028a') {
      content_type: "json",
      events+: [
        "*"
      ],
      secret: "pass:bots/automotive.bluechi/fedoraproject.org/webhook-secret",
    },
  ],
  _repositories+:: [
    orgs.newRepo('bluechi') {
      allow_update_branch: false,
      description: "Eclipse BlueChi is a systemd service controller intended for multi-node environments with a predefined number of nodes and with a focus on highly regulated ecosystems such as those requiring functional safety.",
      has_projects: false,
      has_wiki: false,
      homepage: "https://bluechi.readthedocs.io/en/latest/",
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "containers",
        "controller",
        "linux",
        "podman",
        "services",
        "systemd"
      ],
      webhooks: [
        orgs.newRepoWebhook('https://copr.fedorainfracloud.org/webhooks/github/82383/cc6b5f40-adf7-4168-a023-b500bfb8281a/') {
          content_type: "json",
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
        orgs.newRepoWebhook('https://readthedocs.org/api/v2/webhook/bluechi/254760/') {
          events+: [
            "create",
            "delete",
            "pull_request",
            "push"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('GH_RELEASE_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('PYPI_API_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('QUAY_BOT_API_TOKEN') {
          value: "pass:bots/automotive.bluechi/quay.io/api-token",
        },
        orgs.newRepoSecret('TESTING_FARM_API_TOKEN') {
          value: "pass:bots/automotive.bluechi/github.com/testing-farm-token",
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
        orgs.newBranchProtectionRule('bluechi*') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('bluechi-ppa') {
      allow_update_branch: false,
      description: "PPA repository for BlueChi's .deb packages",
      has_projects: false,
      has_wiki: false,
      homepage: "https://bluechi.readthedocs.io/en/latest/",
      topics+: [
        "containers",
        "controller",
        "linux",
        "podman",
        "services",
        "systemd"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('bluechi-demos') {
      allow_update_branch: false,
      description: "Demos for BlueChi and its tooling",
      has_projects: false,
      has_wiki: false,
      homepage: "https://bluechi.readthedocs.io/en/latest/",
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
      secrets: [
        orgs.newRepoSecret('QUAY_BOT_API_TOKEN') {
          value: "pass:bots/automotive.bluechi/quay.io/api-token",
        },
      ],
    },
    orgs.newRepo('bluechi-ansible-collection') {
      allow_update_branch: false,
      description: "Ansible collection for installing BlueChi controller and agents",
      has_projects: false,
      has_wiki: false,
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "ansible",
        "bluechi"
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('bluechi-on-yocto') {
      allow_update_branch: false,
      description: "Yocto recipe for BlueChi including a basic single-node configuration",
      has_projects: false,
      has_wiki: false,
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "bluechi",
        "yocto"
      ],
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
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
      default_branch: "master",
      delete_branch_on_merge: false,
      description: "hashmap.c",
      has_projects: false,
      has_wiki: false,
      web_commit_signoff_required: false,
    },
    orgs.newRepo('terraform-provider-bluechi') {
      allow_update_branch: false,
      description: "Terraform provider for setting up systems with BlueChi",
      has_projects: false,
      has_wiki: false,
      squash_merge_commit_title: "PR_TITLE",
      topics+: [
        "bluechi",
        "terraform",
        "terraform-provider"
      ],
      workflows+: {
        actions_can_approve_pull_request_reviews: false,
      },
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: 1,
          requires_conversation_resolution: true,
          requires_linear_history: true,
          requires_strict_status_checks: true,
        },
      ],
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}
