### Part 2 - Nextflow hands-on practice - multi-sample workflow development

=== "Part 2 goals and scope"

    Part 2 replicates a "real-life" example of how a bioscientist would encounter and code a Nextflow pipeline for the first time. The key goals of Part 2 include:

    - Demonstrating how the foundational Nextflow concepts introduced in Part 1 is applied in a practical scenario
    - Reiterate the key Nextflow concepts and components that are required for a simple bioinformatics workflow

    What Part 2 is **not**:

    - A guide on bioinformatics or data analyses, reviewing each input or output files and the inner workings of tools in detail
    
=== "Structured and repeated development across lessons"

    Each lesson (2.1 - 2.5) will focus on converting a bash script into a modular Nextflow process. This is to emphasise that there is some boilerplate that will not change across tools, scripts, and analyses in Nextflow pipelines. However, these must be tweaked to fit based on what will be input and output.

    For each lesson, you will guide learners to review:

    1. An existing bash script that conducts one bioinformatics data processing step
    2. Identify which components need to be implemented in a Nextflow process definition
    3. Build that Nextflow process, step-by-step, following a similar order

#### 2.0 Introduction

This section provides the context for Part 2, such as the scenario of converting individual bash scripts into a simple, end-to-end Nextflow pipeline. 

You will introduce:

- The files and data used for Part 2
- The bioinformatics tool
- Nextflow files that you will be changing
- The high-level structure of the workflow that learners will have built by the end of the workshop.

#### 2.1 Our first process and container

=== "Bash script to Nextflow process"

    This is the first occurrence of reviewing a bash script and converting it to a Nextflow process. Recall that, when defining a process, there is some boilerplate code that is unlikely to change (`input:`, `output:`, `script:`), but the contents of each need to be tailored (based on the bash scripts). 
    
=== "Using containers in Nextflow"

    There are many ways to manage software (e.g. modules, conda) and we consider using containers in Nextflow is the best practice. Containers package a tool together with its software environment so that everyone runs the same tool, same version, same dependencies, regardless of where the workflow is executed. As a Nextflow pipeline has many steps requiring different tools, using containers simplifies this and makes your pipeline reproducible.

    There are many container platforms and repositories. For bioinformatics, particularly use in Nextflow, recommend learners to use Singularity (widely supported on HPC systems and suitable for shared environments) and BioContainers that are hosted on quay.io (plenty of pre-built containers for thousands of bioinformatics tools and supported by Nextflow, nf-core, Galaxy)

    Learners do not need to understand the inner working of containers. The key things to communicate is knowing:
    
    - Why they are used
    - Where bioinformatics containers can be searched and retrieved from
    - How to implement a Nextflow process that uses a specific container

#### 2.2 Samplesheets, operators, and groovy

=== "Tuples: grouping related data"

    Tuples are introduced to group related pieces of information together (e.g. sample name + file paths) and prevent accidental mixing of file and metadata. At this stage, **focus on the why, not the mechanics.** 

    More tuple usage will be visited in later lessons.

=== "Reshaping data with operators"

    Operators are often one of the hardest concepts for Nextflow beginners, but one of the most important for developing reproducible and scalable pipelines. They use Groovy syntax and it may not be obvious:

    - Which operator to use
    - When to use it
    - Why the input shape needs to change

    Emphasise the **why**: operators exist to transform input data into the exact structure required by the next process.

    At this stage, learners do not need to memorise operators. they need to understand that:

    - Processes expect inputs in the correct format
    - Operators are the tool used to get data into those formats

    This section demonstrates only one example. Later lessons will showcase different requirements where different operators need to be used.

=== "Development and debugging best practices"

    Use this lesson to model real-world Nextflow development habits:

    - Encourage frequent use of `.view()` to inspect channel outputs
    - Encourage regular use of `-resume` to avoid re-running completed steps
    - Normalise frequent and fast iteration when learners develop their own pipelines

#### 2.3 Multiple process inputs

=== "Accessing process outputs"

    This lesson applies Lesson 1.7 to a bioinformatics use case. Recall that there are different valid ways to access outputs, such as:

    - Adding `.out` to the end of a process name only works for single-element channels
    - For single-element channels, using `.out[0]` is identical to `.out`
    - `emit` can be used to [name outputs](https://www.nextflow.io/docs/latest/process.html#naming-outputs)

=== "When inputs should be grouped together vs. separated"

    In this lesson, learners extend their workflow by defining a process that accepts multiple inputs and chaining it to upstream processes. 
    
    One thing to clarify is when processes should have inputs all in a single tuple, or as separate inputs.

    Emphasise to keep files, values, and metadata together in a tuple if they must stay together (e.g. sample ID, paired FASTQs).
    
    Inputs should be seperate if they can be shared across samples, or are constant across samples. For example, the reference index `transcriptome.fa` can be used across different paired FASTQs.

    Grouping everything as a tuple introduces unecessary data processing steps, while splitting incorrectly can result in unexpected behaviour, such as not all samples running.

#### 2.4 Combining channels, multiple process outputs

This lesson demonstrates how combining channels allows multiple process outputs to be collected and used by a single downstream process.

MultiQC is the ideal example to demonstrate this as it requires all bioinformatics tool outputs to be aggregated and run in a single output.

Note that the `input: path "*"` and `script: multiqc .` blocks follow the MultiQC Nextflow [integration recommendations](https://multiqc.info/docs/usage/pipelines/#nextflow). 

State that this permissive pattern is generally bad practice. Communicate to learners that it is highly preferred to be as explicit the exact files and folders required. This improves error handling, testing, and future maintainability.

#### 2.5 Upscaling to multiple samples and introspection

This final lesson demonstrates how a workflow that works for a single sample can be scaled to many samples without modifying the pipeline code itself. Advise learners that scaling in Nextflow is primarily a configuration problem, not a coding problem. By updating the samplesheet, the same workflow logic is reused to run tasks in parallel across multiple samples.

It is important to communicate that this section is **only an introduction to configuration, benchmarking, and scaling concepts**. Direct learners to the [Nextflow on HPC workshop](https://sydney-informatics-hub.github.io/nextflow-hpc-workshop/) which covers these topics in detail, and was developed as a sequel to this introductory workshop.

