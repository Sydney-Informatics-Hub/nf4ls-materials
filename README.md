# Nextflow for the Life Sciences: Training materials

This repo is a [mirror](https://docs.github.com/en/repositories/creating-and-managing-repositories/duplicating-a-repository#mirroring-a-repository)
of the [Nextflow for the Life Sciences](https://github.com/Sydney-Informatics-Hub/hello-nextflow-2025) delivered in 2025.

This repo is for trainers to fork and rendered on their own GitHub accounts for
delivery.

## How to setup your own copy of the training materials

**Creating a copy of the repository**

1. Fork this repo
2. **Deselect "copy `main` branch only**. This ensures that the `gh-pages` branch is included to render your materials.
3. Optionally, you can change the Owner to an organisation you are apart of.
4. Optionally, you may also rename the repository name
5. Select **Create fork**. This will create a copy in the Owner account you selected.

![](img/setup_0.png)

**Configuring your respository to publish on GitHub Pages**

1. In your forked repo, go to **Settings -> Pages**.
2. Under **GitHub Pages -> Build and deployment**, ensure the **Source** is **Deploy from a branch**.
3. Select **Branch** as **`gh-pages`** and **`/ root**.
4. Select **Save**.

![](img/setup_1.png)

5. Go to **Actions**.
6. Select **"I understand my workflows, go ahead and enable them"**.

![](img/setup_2.png)

After a few seconds, the content should be published on GitHub pages for the
account it was forked into:

`https://<github_account>.github.io/<repo_name>/`

In this example:

`https://fredjaya.github.io/nf4ls-materials/`
