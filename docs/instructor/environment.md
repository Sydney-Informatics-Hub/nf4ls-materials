This page provides information about the technical setup required to run the workshop.

The workshop materials can be adapted for or a range of training environments, including: 

-   cloud-based virtual machines (VMs)
-   institutional HPC or other shared compute environments
-   local installations
-   preconfigured environments provided through another platform or service

## Hardware requirements 

These materials assume this workshop is being delivered in a Linux environment. The minimum resource requirements are: 

- 8 GiB of RAM 
- 2 CPUs 
- 30 GiB disk 

We have previously run this workshop on [ARDC NeCTAR](https://support.ehelp.edu.au/support/solutions/articles/6000205341-nectar-flavors) and [NCI Nirin](https://opus.nci.org.au/spaces/Help/pages/152207472/Nirin+Cloud+User+Guide) Research Cloud platforms.

## Software requirements 

### Participants  

Participants require a personal computer with:

-   VSCode (or a comparable code editor) with the Remote - SSH extension installed
-   a web browser
-   an SSH client (built-in on macOS and Linux; Windows users may need to install [OpenSSH](https://learn.microsoft.com/en-us/windows-server/administration/openssh/openssh_install_firstuse) or use [MobaXterm](https://mobaxterm.mobatek.net/))
-   access to the selected training environment

Before the workshop, participants should install the required software and extensions and confirm that they can successfully connect to the environment that will be used.

### Training environment

The training environment must have the following software installed and available to all participants:

-   [Nextflow](https://www.nextflow.io/docs/latest/install.html) (version 24.04 or later recommended)
-   [Singularity](https://docs.sylabs.io/guides/latest/user-guide/) for container execution
-   [Java](https://www.java.com/en/download/) (required by Nextflow; version 11 or later)
-   All workshop container images pre-pulled to avoid pull delays during the session
-   Workshop files and data staged in a shared or per-user directory

## Example set up instructions 

On your selected infrastructure, you can follow the [Setup instructions](https://github.com/Sydney-Informatics-Hub/hello-nextflow-2025/blob/main/dev_setup/README.md) to install and configure an environment with all software, containers, and files required for the workshop.

### Recommended pre-workshop checks

Before the workshop begins, trainers should verify:

-   All participants can SSH into the training environment
-   Nextflow is available and returns the expected version (`nextflow -version`)
-   Container images have been pre-pulled and are accessible
-   Workshop files are staged and readable by participants
-   Shared learner support space (e.g. Slack, Google Doc) is set up and linked
-   Any platform-specific quotas or access restrictions have been resolved

_SIH and the Australian BioCommons are working towards providing access to a a pre-configured compute environments for self-directed learning, as well as setting up VMs._

