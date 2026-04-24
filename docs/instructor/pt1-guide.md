!!! tip "Part 1 goals and scope"

    Part 1 builds foundational Nextflow knowledge by guiding learners through the incremental development of a simple pipeline from scratch. The key goals of Part 1 include:

    - Introducing the core concepts and syntax of Nextflow in a structured, step-by-step way
    - Giving learners enough working knowledge to begin reading, running, and modifying Nextflow pipelines

    What Part 1 is **not**:

    - A comprehensive tour of Nextflow's full feature set, the focus is on the minimum concepts needed to get started
    - A substitute for hands-on practice with real data, which is the focus of Part 2

## 1.3 Writing your first pipeline

This is the first hands-on Nextflow exercise. In this lesson, you will introduce learners to the fundamental building blocks of a minimal Nextflow script. You'll cover the `process` and `workflow` scopes inside the `main.nf` file, focusing on key `process` components like `input`, `ouput`, and `script`. 

!!! warning "Repetitive build order" 

    The order of steps taken to build the process in the following exercises are intentional. We will be building processes by defining each process block starting with the script then the output. In later sections, we will add input and process directives to this order.

    This order is not prescriptive, however, the script logic often determines how the other process blocks should look like and this order can be helpful for breaking down building processes in a logical way. This approach will be continued in Part 2, when you build an RNAseq workflow!

Your main aim is to ensure learners understand the minimum components needed for a simple, working, one-step pipeline. You can do this by: 

- Highlighting that this lesson is to introduce only the minimum requirements for a Nextflow script
- Reinforcing that there are many ways to achieve the same thing but it is important to be consistent (e.g. see individual concepts below)
- Ensuring they grasp the core concept of having a `process` that does something simple, that is called in the `workflow`
- Using the analogy of `process` being similar to a function in R or Python, but you need to call the function to run it

??? note "Syntax and styling"
    There may be FAQs around Nextflow syntax and styling. For example, if indentation matters - it does in e.g. Python, but Nextflow is relaxed. There are many ways to style, indent, comment, and order code (e.g. process blocks: input, output, script), as well as place process scopes (modules vs. main.nf) and parameters (workflow{}, nextflow.config).

    - Nextflow is flexible, you can do things differently and achieve the same outcome without error
    - It is important to do things consistently for legibility
    - This is especially important when you collaborate with others
    - Recommend to adopt the approaches demonstrated in the workshop

??? note "Single vs. double quotes"
    
    **Double quotes** must be used when a variable needs to be passed. Single quotes will interpret a string literally. For example:
        
        - "Hello ${name}" -> `Hello Fred`
        - 'Hello Fred' -> `Hello Fred`
        - "Hello Fred" -> `Hello Fred`
        - 'Hello ${name}' -> `Hello ${name}`"

    Learners will gain practice with hands-on exercises requiring correct use of single/double quotes throughout the workshop.

??? note "`script` block interpreter"
    
    By default, the `script:` block in a process is executed with bash. It is possible to use a different interpreter via a shebang (e.g. `#/usr/bin/env Rscript`) but can introduce some added complexity. Whilst out of scope for this introductory workshop, suggest adding scripts in the  [`./bin` directory](https://training.nextflow.io/2.1/advanced/structure/#bin).

## 1.4 Running pipelines

In this lesson, you will guide learners through executing the pipeline created in 1.3 using `nextflow run`. The focus here is to highlight the key outputs, and help learners understand these in detail. This includes the Nextflow log that is printed to the terminal, the importance of unique run names and hashes, and the files output by the pipeline such as the `work` directory. 

Once the `work` directory is explained, you will lead into how this is used as a cache for resuming workflows with the `-resume` flag. Finally, you will explain the `publishDir` directory to show how outputs can be organised more conveniently.

- After running a pipeline, teach learners how to read the terminal output and understand the key lines of the Nextflow log. Explain line-by-line and in detail.
- Emphasise the importance of the `work` directory for storing logs and how it plays a role in caching and resuming workflows
- Be direct with learners: Nextflow runs produces many files

??? note "The importance of `publishDir`"
    Using [`publishDir`](https://docs.seqera.io/nextflow/reference/process#publishdir) is a best practice to keep the outputs you want organised, in a predictable place, especially as workflows scale up.

    This is a key feature that Nextflow has over, for example, bash scripts. You will need to manually write a checkpointing feature in bash, whereas it come "out of the box" in Nextflow.

## 1.5 Inputs and channels

This lesson introduces channels with exercises to create a channel, passing a string into a process, and updating the process to expect a string input.

Emphasise that channels are one of the trickiest concepts to learn in Nextflow, but getting it right is crucial as it is what makes Nextflow efficient and reproducible. 

It can be tempting for new learners to manually process inputs and outputs within R or Python scripts (with exceptions: creating folders, moving files, error/file checking), but this **must** be done the Nextflow way, using channels.

??? note "Importance of channels"
    Nextflow watches channels, not code. When a process emits output into a channel, Nextflow knows that output exists and can immediately queue any downstream process that's waiting on it, across any number of samples, in parallel, without you writing any parallelisation logic. 
    
    If you bypass channels and move files manually inside an R or Python script, Nextflow's scheduler is blind to that work. It can't track those files for caching, can't parallelise across samples, and `-resume` will re-run things it shouldn't.
    
    In short: channels are the contract between the user's pipeline logic and Nextflow's execution engine. Everything that makes Nextflow better than a bash script — parallelism, caching, portability, scalability — depends on data moving through channels correctly.

Reassure learners that this lesson will focus on a conceptual introduction to channels, and Part 2 will provide learners with opportunities to implement channels for different bioinfomatics use cases. There are different ways that channels should be used, and manipulated with groovy, but this is beyond the scope of this introductory workshop. Suggest useful resources such as [Nextflow patterns](https://nextflow-io.github.io/patterns/) which have examples of different use cases using channels. 

Key things to mention:

- Channels are the backbone of Nextflow workflows. It passes information (data, parameters, values) into and between processes 
- Channels are how Nextflow allows you to run jobs in parallel - when set up correctly Nextflow will automatically figure out which jobs are ready to be run
- Clarify the difference between multiple inputs vs. multiple channels
- DO NOT use `publishDir` as an input to a process. `publishDir` is a way to organise output files after jobs finish running

## 1.6 Parameters

This lesson demonstrates how learners can leverage parameters to make your Nextflow pipelines flexible for many different files and options.

The key idea to communicate is that we develop pipelines because, more often than not, need to run the same processing over many samples. If you develop the pipeline to work on one sample, it will need to be updated when the samples change. 

??? note "Importance of using parameters" 
    Parameters overcome this by allowing users to specify different values during runtime, or use a default if none is specified.

Reinforce the use of parameters through the exercises. For the last exercise, allow adequate time for learners to experiment adding different values (strings) to the `--greeting` and `--outdir` parameters. 

Suggest that they can use the solution and inspect the output but to have a go themselves. Remind learners that multi-word strings must be enclosed in either single or double quotes.

## 1.7 Adding processes

This lesson is the first demonstration of connecting processes, where the output of `SAYHELLO` is used as an input to a new `CONVERTOUPPER` process.

Suggest spending minimal time demonstrating what `tr` does to allow learners more time to independently work through the exercise involving piecing together the `CONVERTTOUPPER` process. Encourage learners the use of hint boxes within the lesson materials.

??? note "Accessing process outputs"

    There are different ways to access outputs:

    - Adding `.out` to the end of a process name only works for single-element channels
    - For single-element channels, using `.out[0]` is identical to `.out`
    - `emit` can be used to [name output](https://www.nextflow.io/docs/latest/process.html#naming-outputs)


Recall that the order we suggest of adding a new process is reflected in the hints:

1. `script`
2. `output`
3. `input`
5. Updating `workflow{}`

## 1.8 Dynamic naming

Similar to lesson 1.6 Parameters, this lesson will guide learners to make pipelines more flexible and adaptable for use across samples by automatically (dynamically) naming output files based on the name of the input. This becomes important to correctly identify outputs when running across multiple samples or files.
