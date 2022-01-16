# gitlist Dockerfile

This project provides an all-in-one docker contain that runs [gitlist](https://github.com/klaussilveira/gitlist).
This project has no affiliation with the gitlist project and does not intend to imply any ownership or licensing for
said project.

## Running the container

By default the container runs on a non secured http server (Apache) on port 80. It also assumes that the git
repositories are mounted in at `/repos`. Currently the container is using PHP 8.1, this produces a number of deprecated
warnings. The php.ini is using the distributed "production" file which suppresses several warnings including deprecated.

Additionally, the web config exposes `/_repos` as a browseable index of the mapped in repositories. This can be used
as a permissions check if repositories are not being seen/listed.
