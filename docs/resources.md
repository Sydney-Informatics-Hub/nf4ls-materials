# Supporting materials

## Glossary

| Term                         | Definition                                                                                                                                                                                                                                                                                                           |
|:---------------------------- |:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Channels**                 | Asynchronous first-in, first-out (FIFO) queues used for communication between processes. They are the 'pipes' of the pipeline, defining how data flows between processes.                                                                                                                                            |
| **Channel factories**        | Special functions used to create channels. Common examples include `Channel.of()`, `Channel.fromPath()`, and `Channel.fromFilePairs()`.                                                                                                                                                                              |
| **Containers**               | Self-contained environments that package all the software and dependencies needed for each tool, ensuring consistency, reproducibility, and portability across different systems. Singularity containers are used.                                                                                                   |
| **Directives**               | Definition blocks that a process may contain, used to define settings like `publishDir`, `container`, or `tag`.                                                                                                                                                                                                      |
| **Executor**                 | The component that determines how and where a process script is executed.                                                                                                                                                                                                                                            |
| **Input Block**              | A required block within a process definition used to define the input data for the process. Input definitions must include a qualifier (e.g., `val` or `path`) and a name.                                                                                                                                           |
| **`main.nf`**                | The core script that defines the steps of a Nextflow workflow. It outlines each process and how they are connected, focusing on _what_ the workflow does.                                                                                                                                                            |
| **Nextflow**                 | A **workflow orchestration engine and domain-specific language (DSL)** that makes it easy to write data-intensive computational workflows. It defines complex program interactions and a high-level parallel computational environment based on the dataflow programming model.                                      |
| **`nextflow.config`**        | A key file for any Nextflow workflow that allows defining important settings and configurations that control _how_ the workflow should run. It can be used to manage Singularity containers, resource usage (e.g., CPUs), and reporting.                                                                             |
| **`output` block**           | A block in a process definition used to define the output data the process is expected to produce. It requires both an output qualifier (e.g., `path` or `val`) and an output name.                                                                                                                                  |
| **Parameters (`params`)**    | Special values that can be set from command line arguments, allowing for flexible and dynamic pipelines. They are globally accessible by both processes and workflows and can be customized at runtime using a double hyphen flag (e.g., `--greeting`).                                                              |
| **Processes**                | Small units that make up Nextflow workflows. A process describes a single step of the pipeline, including its inputs, expected outputs, and the code to run it. Processes execute independently as tasks and communicate via channels.                                                                               |
| **`publishDir` directive**   | A process directive used to specify where and how output files should be saved. This instructs Nextflow to copy all of the process' outputs to a specified directory, which helps organize results neatly. It is not recommended to use the directory created by this directive as an input to subsequent processes. |
| **Queue channels**           | The more common type of channel that holds a series, or queue, of values and passes them into a process one at a time. The order of values in a queue channel is non-deterministic (First-In, First-Out or FIFO).                                                                                                    |
| **Samplesheet**              | A delimited text file (like a CSV) where each row contains information or metadata that needs to be processed together. Using samplesheets is considered best practice for reading grouped files and metadata into Nextflow.                                                                                         |
| **`script` block**           | A required block within a process definition that contains the command and logic that will be executed (e.g., Bash, Python, or R code).                                                                                                                                                                              |
| **`tag` directive**          | A process directive that allows adding a custom label to each executed task. It is useful for identifying what is being run when executing workflows, especially with multiple samples, and for profiling.                                                                                                           |
| **Tasks**                    | Independent units of execution for processes. When a task is created, Nextflow stages the input files, script, and other helper files into the task directory.                                                                                                                                                       |
| **Tuple**                    | An ordered collection of objects. When a tuple is used as input to a Nextflow process, it ensures that the objects inside are grouped and processed together as a single unit.                                                                                                                                       |
| **Value channels**           | Channels that store one and only one value, which can then be used multiple times.                                                                                                                                                                                                                                   |
| **Work Directory (`work/`)** | The location where Nextflow runs all processes and stores their associated files. Every time a process is run, a directory inside `work/` is created with a unique randomly-generated ID. By default, all files created by processes exist only inside this directory.                                               |
| **Workflow**                 | The overall composition of processes and dataflow logic. It is created by joining together processes and defines the logic that puts all of the processes together.                                                                                                                                                  |

## Recommended resources

Here are some useful resources we recommend to help you get started with running nf-core pipelines and developing Nextflow pipelines:

### Developed by us

* [SIH Nextflow template](https://github.com/Sydney-Informatics-Hub/template-nf)
* [SIH Nextflow template guide](https://sydney-informatics-hub.github.io/template-nf-guide/)
* [SIH Customising nf-core workshop](https://sydney-informatics-hub.github.io/customising-nfcore-workshop/)
* [Australian BioCommons Seqera Platform Service](https://www.biocommons.org.au/seqera-service)
* [NCI Gadi nf-core instutitonal config](https://nf-co.re/configs/nci_gadi/)
* [Pawsey Setonix nf-core instutitional config](https://nf-co.re/configs/pawsey_setonix/)

### Developed by others

* [Nextflow training](https://training.nextflow.io/)
* [Nextflow patterns](https://nextflow-io.github.io/patterns/index.html)
* [Nextflow blog](https://www.nextflow.io/blog.html)
* [Nextflow coding best practice recommendations](https://carpentries-incubator.github.io/Pipeline_Training_with_Nextflow/07-Nextflow_Best_Practice/index.html)
* [Seqera community forums](https://community.seqera.io/)

## Nextflow tips and tricks

Nextflow has some useful features for executing pipelines and querying metadata and history. Here are some resources to help you get started.

### Query specific pipeline executions

The [Nextflow log](https://www.nextflow.io/docs/latest/cli.html#log) command is useful for querying execution metadata and history. You can filter your queries and output specific fields in the printed log.

```default
nextflow log <run_name> -help
```

### Execute Nextflow in the background

The [`-bg`](https://www.nextflow.io/docs/latest/cli.html?highlight=bg#execution-as-a-background-job) options allows you to run your pipeline in the background and continue using your terminal. It is similar to `nohup`. You can redirect all standard output to a log file.

```default
nextflow run <workflow_repo/main.nf> -bg > workshop_tip.log
```

### Capture a Nextflow pipeline's configuration

The [Nextflow config](https://www.nextflow.io/docs/latest/cli.html#config) command prints the resolved pipeline configuration. It is especially useful for printing all resolved parameters and profiles Nextflow will use to run a pipeline.

```default
nextflow config <workflow_repo> -help
```

### Clean Nextflow cache and work directories

The [Nextflow clean](https://www.nextflow.io/docs/latest/cli.html#clean) command will remove files from previous executions stored in the `.nextflow` cache and `work` directories. The `-dry-run` option allows you to preview which files will be deleted.

```default
nextflow clean <workflow_repo> -help
```

### Change default Nextflow cache strategy
Workflow execution is [sometimes not resumed as expected](https://training.nextflow.io/basic_training/cache_and_resume/#resume-troubleshootingl). The [default behaviour of Nextflow cache keys](https://www.nextflow.io/docs/latest/process.html#cache) is to index the input files meta-data information. Reducing the cache stringency to `lenient` means the files cache keys are based only on filesize and path, and can help to avoid unexpectedly re-running certain processes when `-resume` is in use.

To apply lenient cache strategy to all of your runs, you could add to a custom configuration file:

```default
process {
    cache = 'lenient'
}
```

You can specify different cache stategies for different processes by using `withName` or `withLabel`. You can specify a particular cache strategy be applied to certain `profiles` within your institutional config, or to apply to all profiles described within that config by placing the above `process` code block outside the `profiles` scope.

### Access private GitHub repositories

To interact with private repositories on GitHub, you can provide Nextflow with [access to GitHub](https://www.nextflow.io/docs/latest/sharing.html#github-credentials) by specifying your GitHub user name and a [Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) in the [`scm` configuration file](https://www.nextflow.io/docs/latest/sharing.html#scm-configuration-file) inside your specified `.nextflow/` directory:

```default
providers {

  github {
    user = 'georgiesamaha'
    password = 'my-personal-access-token'
  }

}
```
