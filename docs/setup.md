---
title: How to create a blog with Material MkDocs
description: >
    Step-by-step guide to integrating the Material MkDocs blogging functionality into your own website.
---

!!! note "Note"

    - This template is designed to be used with Material MkDocs.

    - These instructions assume some familiarity with [MkDocs](https://www.mkdocs.org) & 
    [Material MkDocs](https://squidfunk.github.io/mkdocs-material/).

    - There are other blog plugins for MkDocs probably more useful than this.
    
        - [Mkdocs Blogging Plugin](https://pypi.org/project/mkdocs-blogging-plugin/)
        - [Mkdocs Blog Plugin](https://pypi.org/project/mkdocs-blog-plugin/)
        - [Mkdocs RSS Plugin](https://pypi.org/project/mkdocs-rss-plugin/)

## Setup

### Starting From Scratch

1. Clone this repository locally.

    ```shell
    git clone 
    cd mkdocs-blog-template
    ```

2. Setup Dependencies

    ```shell
    # recommended to use a venv.
    pip install -r requirements.txt
    ```

3. Add a new blog post anywhere under the `/blog` directory and append the [required metadata](#configuring-a-blog-post).

    ```shell
    # A helper command will do this for you.
    cp first_post.txt docs/blog/2021/first_post.md
    ```

4. Add this new post to the `mkdocs.yml` navigation configuration.

    ```yaml hl_lines="7"
    nav:
      - Home: index.md
      - Blog:
          - blog/index.md
          - 2021:
              - blog/2021/how_to_build_this_blog.md
              - blog/2021/first_post.md
          - subtopic:
              - blog/subtopic/boring_post.md
              - blog/subtopic/interesting_post.md
    ```

5. [Configure](#configuration) the templates.

    ```yaml hl_lines="2-10"
    extra:
      blog:
        dir: blog
        author: Ryan Kelly
        author_image: https://avatars.githubusercontent.com/u/93479011
        words_read_per_minute: 300
        list_length: 25
        extended_preview: true
    ```

7. Start MkDocs and look at your new page in the browser!

    ```shell
    mkdocs serve
    ```
    Browser connected: [http://127.0.0.1:8000/](http://127.0.0.1:8000/)

### Adding A Blog To An Existing Site

<p hidden>#more</p>

1. Copy + Paste the directory `/overrides` into your site.
2. Copy + Paste the directory `/docs/stylesheets` into your site.
3. Add the following line to your `theme` section in `mkdocs.yml`.

    ```yaml hl_lines="2"
    theme:
      custom_dir: overrides
    ```

4. Add the following line to your `mkdocs.yml` to apply the custom styles.

    ```yaml
    extra_css:
      - stylesheets/extra.css
    ```

5. [Configure](#configuration) the templates (instructions below).


## Configuration

This template extension exposes the following variables to configure your blog.

```yaml
blog:
  dir: blog
  author: Ryan Kelly
  author_image: https://avatars.githubusercontent.com/u/93479011
  words_read_per_minute: 300
  list_length: 25
  extended_preview: true
```

`dir` (optional)

:   Sets the directory where your blog posts are located (`blog`, `posts`, `articles`, etc.). Defaults to `blog`. 

`author` (optional)

:   If set, the `author` will be rendered in the `signature`.

`author_image` (optional)

:   If set, the `author_image` will be rendered in the `signature`.


`words_read_per_minute` (optional)

:   Used to estimate the read time in the `signature`. 
    Defaults to 300.

`list_length` (optional)

:   Determines the number of blog posts to show in the `blog_list.html` template.
    Defaults to 25.


`extended_preview` (optional)

:   If set, the `blog_list.html` template will render a preview of the post content.
    Any content in your blog post above the special `<p hidden>#more</p>` tag will be shown in the preview.
    You can manually place this tag anywhere within your blog post. 

### Configuring The Signature

The signature is configured by:

- Your Material MkDocs [extra.social](https://squidfunk.github.io/mkdocs-material/setup/setting-up-the-footer/#social-links) 
section to generate the social links.
- The `author` and `author_image` options from the new [configuration section](#configuration) under `extra.blog`.

### Configuring A Blog List

- After following the [quickstart](#setup),
add this template metadata to any page that you want to display a list of blog posts.

```markdown
---
template: blog_list.html
---

Add any markdown content here, the blog list will be displayed below it.
```

### Configuring A Blog Post

- After following the [quickstart](#setup), 
 add this template metadata to the page that you want to become a blog post.
- Any content in your blog post above the special `<p hidden>#more</p>` tag will be shown in the preview.
    - You can manually place this tag anywhere within your blog post. 

```markdown
---
template: blog_post.html
title: Cool post
description: Informative description
date: 1984-01-01
---

This content will be present in the `blog_list.html` template preview.

<p hidden>#more</p>

More content
```

`title`

:   Will be rendered in the `HTML` `<title>` tag, 
    and sets an `<h2>` tag in your blog post and blog list.

`description`

:   Will be rendered in the `HTML` `<meta description>` tag, 
    and sets a description under the title in your blog post and blog list.

`date`
:   Expected format: `YYYY-MM-DD`, rendered in the [signature](#blog-signature)


## Notes

- I've used a lot of markdown extensions to document the instructions, but they aren't all required.
