# elineharbers.nl

Website for singer and conductor Eline Harbers.

---

### Technical details

- [**Decap CMS**](https://decapcms.org/) (previously known as Netlify CMS); a git-based content management system
- [**HUGO**](https://gohugo.io/); static site builder

**Run locally** with the `compose-dev.yaml` Docker Compose stack.

**Deploy** with the `Dockerfile` (or `compose-prd.yaml`) Docker Compose stack.

### Additional configuration
Basically, none. But do keep in mind to keep the `static/admin/config.yml` file up to date (especially w.r.t. the
GitHub repository link).
