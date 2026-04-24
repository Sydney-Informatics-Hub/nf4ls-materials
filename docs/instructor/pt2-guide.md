!!! tip "Part 2 goals and scope"

    Part 2 replicates a "real-life" example of how a bioscientist would encounter and build a Nextflow pipeline for the first time. The key goals of Part 2 include:

    - Demonstrating how the foundational Nextflow concepts introduced in Part 1 are applied in a practical scenario
    - Reiterating the key Nextflow concepts and components required for a simple bioinformatics workflow

    What Part 2 is **not**:

    - A guide on bioinformatics or data analysis — avoid reviewing the inner workings of tools or the biology of each input and output file in detail

??? note "Structured and repeated development across lessons"

    Each lesson (2.1 - 2.5) will focus on converting a bash script into a modular Nextflow process. This is to emphasise that there is some boilerplate that will not change across tools, scripts, and analyses in Nextflow pipelines. However, these must be tweaked to fit based on what will be input and output.

    For each lesson, you will guide learners to:

    1. Review an existing bash script that conducts one bioinformatics data processing step
    2. Identify which components need to be implemented in a Nextflow process definition
    3. Build that Nextflow process step-by-step, following a similar order to Part 1

## 2.0 Introduction

This section sets the context for Part 2: converting a set of individual bash scripts into a simple, end-to-end Nextflow pipeline for RNA-seq data preparation.

You will introduce:

- The files and data used throughout Part 2
- The bioinformatics tools being used
- The Nextflow files that learners will be modifying
- The high-level structure of the workflow that learners will have built by the end of the workshop

## 2.1 Our first process and container

This is the first occurrence of reviewing a bash script and converting it to a Nextflow process. Walk learners through the bash script before asking them to identify the components that map to Nextflow process blocks.

- Recall that there is boilerplate code unlikely to change across processes (`input:`, `output:`, `script:`), but the contents of each must be tailored to the tool being run
- Learners do not need to understand the inner workings of containers — focus on why they are used, where to find them, and how to specify one in a process

??? note "Why containers?"

    There are many ways to manage software (e.g. modules, conda) but using containers in Nextflow is best practice. Containers package a tool together with its software environment so that everyone runs the same tool, same version, and same dependencies, regardless of where the workflow is executed.

    For bioinformatics, recommend learners use Singularity (widely supported on HPC systems) and BioContainers hosted on quay.io, which provides pre-built containers for thousands of tools and is supported by Nextflow, nf-core, and Galaxy.

## 2.2 Samplesheets, operators, and Groovy

This lesson introduces structured inputs via a samplesheet and the use of operators to reshape channel data. Operators are often one of the hardest concepts for Nextflow beginners — focus on the **why**, not the mechanics.

- Emphasise that operators exist to transform input data into the exact structure required by the next process
- Learners do not need to memorise operators — they need to understand that processes expect inputs in a specific format and operators are how you get data into that format
- Use `.view()` frequently to show learners what channel contents look like before and after an operator is applied

??? note "Tuples: grouping related data"

    Tuples are introduced to group related pieces of information together (e.g. sample name + file paths) and prevent accidental mixing of files and metadata. At this stage, **focus on the why, not the mechanics.**

    More tuple usage will be visited in later lessons.

??? note "Development and debugging best practices"

    Use this lesson to model real-world Nextflow development habits:

    - Encourage frequent use of `.view()` to inspect channel outputs
    - Encourage regular use of `-resume` to avoid re-running completed steps
    - Normalise frequent and fast iteration when learners develop their own pipelines

## 2.3 Multiple process inputs

This lesson applies the process-chaining concepts from Lesson 1.7 to a bioinformatics use case. Learners extend their workflow by defining a process that accepts multiple inputs and wiring it to upstream processes.

One key concept to clarify is when inputs should be grouped in a single tuple versus kept as separate inputs:

- Keep files, values, and metadata together in a tuple if they must travel together (e.g. sample ID + paired FASTQs)
- Keep inputs separate if they are shared across samples or constant (e.g. a reference index used by all samples)
- Grouping everything into a tuple introduces unnecessary data reshaping; splitting incorrectly can cause unexpected behaviour such as samples not running

??? note "Accessing process outputs"

    There are different valid ways to access process outputs:

    - Adding `.out` to the end of a process name works for single-output channels
    - For single-element channels, `.out[0]` is identical to `.out`
    - `emit` can be used to [name outputs](https://www.nextflow.io/docs/latest/process.html#naming-outputs) and is preferred in more complex workflows

## 2.4 Combining channels and multiple process outputs

This lesson demonstrates how combining channels allows outputs from multiple processes to be collected and passed to a single downstream process.

MultiQC is the ideal example here: it requires outputs from all upstream tools to be aggregated before it can run.

- Note that the `input: path "*"` and `script: multiqc .` pattern follows the MultiQC Nextflow [integration recommendations](https://multiqc.info/docs/usage/pipelines/#nextflow)
- State clearly that this permissive pattern is generally bad practice — it is used here because MultiQC requires it, not as a model to follow
- Communicate that in most cases it is strongly preferred to be explicit about which files and folders a process receives, as this improves error handling, testing, and maintainability

## 2.5 Upscaling to multiple samples and introspection

This final lesson demonstrates how a workflow built for a single sample scales to many samples without any changes to the pipeline code itself.

- Advise learners that scaling in Nextflow is primarily a configuration problem, not a coding problem — by updating the samplesheet, the same workflow logic runs tasks in parallel across all samples
- This section is **only an introduction** to configuration, benchmarking, and scaling concepts
- Direct learners to the [Nextflow on HPC workshop](https://sydney-informatics-hub.github.io/nextflow-hpc-workshop/) for a full treatment of these topics, which was developed as a sequel to this introductory workshop
