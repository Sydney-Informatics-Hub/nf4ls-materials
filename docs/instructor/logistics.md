This page outlines how the workshop can be organised and delivered in different contexts.

The workshop material can be adapted for:

-   **online** 
-   **in-person**
-   **hybrid**
-   or **self-paced** delivery.

The workshop material is organised into two parts:

=== "Part 1 - **Nextflow foundations**"

    Introduces the core concepts of Nextflow pipeline development and provides learners with the foundational knowledge needed to begin building workflows.

=== "Part 2 - **Nextflow hands-on practice - multi-sample workflow development**"

    Provides hands-on practice in creating a scalable multi-sample Nextflow workflow for RNA-seq data preparation.

## Workshop structure and suggested timing

The goal of this workshop is to teach Nextflow best practices, and highlight the most important features to know and learn about amongst Nextflows large, and often daunting, repertoire. 

Whilst there is a lot of technical information that needs to be covered in detail, remember to tie it back to the biology - your audience are bioscientists that need to use Nextflow to process data and run analyses for their research or applied goals. 

Suggested timings for each module are provided below and can be adapted to suit local needs, learner experience, and delivery mode.

### Part 1 - Nextflow foundations

| Lesson                              | Teaching Objective                                            | Learning Outcome                                                                              | Learning Experience                                                    | Approx. Time |
| ----------------------------------- | ------------------------------------------------------------- | --------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- | ------------ |
| **1.0 Introduction to Nextflow** | High-level overview of Nextflow and its uses | Learners can identify the context of preliminary uses for bioinformatics pipelines                              | Lecture             | 10 min    |
| **1.1-1.2 Introduciton to Part 1 and Hello World!** | Introduce the structure of the iterative pipeline for Part 1 and the bash commands used | Learners can identify the high-level structure of piecing together bash commands in a pipeline                             | Demonstration and code-along              | 15 min    |
| **1.3 Writing your first pipeline** | Introduce the minimum viable structure of a Nextflow pipeline | Learners can identify and write a simple `process` and `workflow`                             | Guided code-along building a minimal pipeline step-by-step             | 20 min min    |
| **1.4 Running pipelines**           | Explain how Nextflow executes workflows and manages outputs   | Learners can run a pipeline, interpret logs, and understand `work`, caching, and `publishDir` | Live execution, log walkthrough, discussion of outputs and caching     | 15 min    |
| **1.5 Inputs and channels**         | Introduce channels as the core dataflow mechanism             | Learners understand why channels are required and how to pass simple inputs                   | Conceptual explanation + small exercises creating and passing channels | 20 min    |
| **1.6 Parameters**                  | Make pipelines flexible using parameters                      | Learners can define and override parameters at runtime                                        | Code-along with parameterised examples and short experimentation       | 15 min    |
| **1.7 Adding processes**            | Demonstrate chaining processes together                       | Learners can connect processes using outputs as inputs                                        | Guided exercise building and wiring a second process                   | 15 min    |
| **1.8 Dynamic naming**              | Introduce dynamic output naming                               | Learners can generate outputs that scale across inputs                                        | Short demonstration + modification of existing code                    | 15 min    |

### Part 2 - Nextflow hands-on practice - multi-sample workflow development

| Lesson                                  | Teaching Objective                                 | Learning Outcome                                                       | Learning Experience                                           | Approx. Time |
| --------------------------------------- | -------------------------------------------------- | ---------------------------------------------------------------------- | ------------------------------------------------------------- | ------------ |
| **2.0 Introduction**                    | Set context for Part 2 workflow                    | Learners understand the scenario, data, and end goal                   | Instructor walkthrough of data, tools, and workflow structure | 10 min    |
| **2.1 First process & containers**      | Convert a bash script into a containerised process | Learners can map bash scripts to Nextflow processes and use containers | Code-along converting bash → process with container           | 20 min    |
| **2.2 Samplesheets, operators, Groovy** | Introduce structured inputs and data reshaping     | Learners understand why tuples and operators are required              | Concept-focused walkthrough with examples and debugging demos | 30 min    |
| **2.3 Multiple process inputs**         | Teach input structuring and process chaining       | Learners can decide when to group vs separate inputs                   | Guided workflow wiring with discussion of design decisions    | 25 min    |
| **2.4 Combining channels & outputs**    | Demonstrate aggregation patterns                   | Learners understand when aggregation is appropriate (e.g. MultiQC)     | Example-driven explanation using MultiQC                      | 30 min    |
| **2.5 Upscaling & introspection**       | Show how pipelines scale without code changes      | Learners understand scaling via configuration and samplesheets         | Demonstration + discussion; pointer to HPC workshop           | 25 min    |

## Delivery considerations

When planning delivery, trainers should consider:

-   whether the workshop will be run online, in person, or hybrid
-   the number of trainers and facilitators available
-   the learner group’s prior experience with command line tools, workflows, and bioinformatics
-   the time needed for setup, troubleshooting, and hands-on support
-   how questions and discussion will be managed during the session

A shared collaborative space such as a Google Doc can be useful for collecting questions, troubleshooting issues, and sharing links and tips during the workshop. You can find a template [here](../assets/Discussion%20board%20-%20Nextflow%20for%20the%20life%20sciences%202025.docx).
