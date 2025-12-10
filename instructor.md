# Instructor notes 

## Overview 

Learning Nextflow for the first time can be daunting due to the number of features, settings, and concepts that new users need to learn. Many existing Nextflow documentation and training materials outline the things that you can do, but lacks clarity on the key ones required to get started with developing your own pipeline. 

This workshop helps life scientists overcome those barriers by: 

- Focusing on the essential concepts required to build a functional pipeline 
- Introducing these concepts sequentially, with each step building on earlier understanding 
- Demonstrating these ideas first in a simple “toy” workflow, then applying them to a realistic bioinformatics example 

The workshop is divided into two parts: 

- **Part 1:** Foundations of Nextflow (processes, workflow scopes, channels, inputs/outputs, operators) 
- **Part 2:** Applying these foundations to build a real-world RNA-seq workflow 

The content is delivered as demonstrations (instructors guide participants through the rendered webpage) combined with hands-on exercises as either a code-along (follow the instructor), or independently (time is provided for learners to attempt exercises).

## Workshop components 

There are several links and documents required to run this workshop. This is a reference that compiles all of them. Instructions provided later in the document. 

| Component            | Description                                                                                                                                                    |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Instructor notes     | This page.                                                                                                                                                 |
| [Materials Repository](https://github.com/Sydney-Informatics-Hub/nf4ls-materials) | GitHub repository to generate the github pages with the teaching materials, content, and exercises                                                             |
| [Data repository](https://github.com/Sydney-Informatics-Hub/nf4ls-data)      | GitHub repository to setup a new environment for attendees. Includes installing all required software, folder structure and files required to run the workshop |

## Strengths and weakenesses of the workshop

This section reflects on the feedback and experience from delivering this content from past workshops. These notes are compiled directly from participant (learner) feedback, and discussion between trainers, facilitators, and coordinators.

### Strengths 

Several elements of the current workshop have proven particularly effective and should be aimed to be kept in future delivery.

**Iterative, step-by-step code alone exercises**

The most consistent positive feedback relates to the incremental, guided nature of the materials. Each section builds directly on the previous one, helping learners form a model of how Nextflow pipelines are constructed that can be applied to their own development. As there are a lot of concepts that need to be selected from the documentation and introduced, this allows each of these to be explained in detail without overwhelming learners.  

**Opportunities for learners to code themselves**

Fold-out “solution” blocks work well: learners can attempt each exercise independently, then reveal the answer if needed. This supports mixed-experience groups while keeping that pace manageable. 

 

Practical guidelines and best practices 

Many aspects of effective Nextflow development (e.g., naming, structure, dataflow thinking) are not immediately obvious from the official documentation. The workshop introduces these patterns and provides guidelines on how to implement them. 

 

Pre-configured workshop environments 

The workshop needs the same folder structure and input files. Configuring learner compute environments on an Ubuntu VM (e.g. previously NCI Nirin, Nectar cloud) ensures all participants are using the same operating system, software version, and files. This has worked fantastically and allowed the workshop to focus on the delivery of teaching material. 

 

Weaknesses and suggested improvements 

 

While the workshop has been well-received, these are several areas that could be optionally improved to strengthen learning outcomes and meet sound curriculum design. 

 

Limited learning assessments and formative checks 

The workshop relies heavily on guided explanation and code-alongs, which works well given the conceptual load. However, this does not explicitly test understanding. Learning is determined when code is added correctly, and when pipelines run as intended - this does not guarantee learners understanding the introduced concept.  

Suggested improvements: 

Develop small assessments to ensure learner understanding. For example, formative assessments throughout the workshop such as asking learners to reflect and note how they would apply concepts to their own pipelines; or inviting learners to reflect and note what they have learnt, want to know about further, and a question 

 

Polls are not effective 

Recurring feedback includes poll questions tend to be vague, and allowing enough time for learners to respond was insufficient. 

Suggested improvements: 

Consider how learners will access polls 

Replace with the formative checks mentioned above 

 

Part 1 is too slow 

The section on bash (Part 1.2) occupies too much time given that this is a prerequisite for learners. This was inherited from an early version of the workshop that was tightly linked to Seqera’s Hello Nextflow training. 

Suggested improvements: 

Remove section 1.2, or move this to a brief overview at the start of the next section 

Use the gained time to focus on the Nextflow-specific concepts towards the end of Part 1 

Preparing to teach 

Organising the workshop 

Familiarise yourself with the content 

Run through the self-directed workshop at ... 

Identify co-trainers and facilitators 

We recommend having two lead trainers, X facilitators, Y coordinators, etc. 

Use email templates 

Identifying compute environment 

It is essential that all participants and trainers use the same version of software and have the same computational resources. We highly recommend you configure virtual machines for learners to access and use for the workshop exercises.  

See nf4ls-data: Machine requirements for the minimum specifications required per user. 

e.g. what has worked in the past e.g. Nirin, Nectar. Reach out to X 

 

Preparing for the workshop 

Configure your own fork of the materials, following nf4ls-materials: How to setup your own copy of the training materials 

Amend the rendered page with your workshop details (e.g. trainers, facilitators) 

Optional 

Add, change, amend any content on your fork 

Suggest changes to the nf4ls-materials or nf4ls-data content so future instructors can benefit from your improvements 

On your selected infrastructure, follow nf4ls-data: Installation and setup to configure an environment with all software, containers, and files required for the workshop. See Contribution guidelines (TODO) 

TODO All other preparation, rehearsals etc. To prepare for confident delivery 

 

Delivery tips 

 

Have VSCode, and the rendered content on your screen as you deliver 

Trainers invite learners to copy and paste code blocks throughout the workshop for accuracy (i.e. avoid typos that result in pipeline errors). 

Trainers type out code additions and explain as they type. This allows trainers to provide more context and explain what is being added. Also helps to slow the pace of delivery to allow learners to catch up. 

Trainers verbally announce when they are moving between windows or tabs. For example “I am now going to the VSCode terminal...”. Participants will need to manage going between the workshop content in their browser, VSCode, and Zoom and this will help them follow you 

 

Lesson guides 

 

TODO: start with concept map, how do things build off each other 

TODO: lesson-by-lesson explanations, of “why”, and key things to help instructors deliver material 

 