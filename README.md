## To-Do WebApp on NodeJs

**Table of Content**

*   [About The Project](#about-the-project)
    *   [Build](#build)
*   [Getting Started](#getting-started)
    *   [Prerequisites](#prerequisites)
    *   [Installation](#installation)
*   [Usage](#usage)
    *   [With dockerfile](#with-dockerfile)
    *   [With docker-compose](#with-docker-compose)
*   [Roadmap](#roadmap)
*   [Contributing](#contributing)
*   [Contact](#contact)

# About The Project

This project is from @LondheShubham153 and I have forked it to build a CI/CD project on Jenkins.

The Features:

The project is a Todo webapp which can

*   Create Todo list 
*   Can accept new entries 
*   And can also delete them.

![project_output](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/c11bb3f4ecab4624998676f6ab9da2f10767b3ce26659487.png)

## Build

The project is built on 

*   NodeJs 
*   ExpressJs
*   EJS

Has Dependencies:

*   chai
*   mocha
*   nyc
*   supertest

<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>

# Getting Started

## Prerequisites

To build a CI-CD project you need to have these installed on your system. (I am using AWS EC2 Ubuntu Server 22.04 for this project.)

*   Docker
*   Jenkins
*   This repository

## Installation

If you do not have installed docker and Jenkins, then refer to my blogs to install these tools.

*   Docker - [https://neel-soni.hashnode.dev/install-docker-on-ubuntu-and-centos](https://neel-soni.hashnode.dev/install-docker-on-ubuntu-and-centos)
*   Jenkins - [https://neel-soni.hashnode.dev/create-push-pull-repo-in-github](https://neel-soni.hashnode.dev/create-push-pull-repo-in-github)

<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>

# Usage

Here are the two parts of the ci/cd project:

*   [With dockerfile](#with-dockerfile)
*   [With docker-compose](#with-docker-compose)

## With dockerfile

1.  **Create a job on Jenkins**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/079f8a19b7b4d9b2523e4b8f4d04f379df33e61d67998c0e.png)
2.  **Get the repo link**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/82aa9c37ae34c833ecbc64b00a56136da0cc0af4e8da1ba5.png)
3.  **Add description and add github repo in GitHub project section**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/a314df1357d4372b8613b04ee68a49433fca5b663eb224ec.png)
4.  **Add github repo**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/8de7e2f909a70cf0de920d1174116cb851829bccdcf6c7c7.png)
5.  **Enable GitHub Webhook**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/ccf6441c3878ae9e54ccefc2f0049ec8a12d4ae85c1f3f21.png)
6.  **Create github hook**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/1f61f70a158dbeaf2348147e6647612f96caeeef35cdda6f.png)
7.  **Create a dockerfile**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/2aa772bf7f5965be1dd668f29c3ad4304078bb2b462ce65e.png)
8.  **Add shell script to build and run docker, then save the project.**
    1.  `docker kill node-todo-container && docker rm node-todo-container`
    2.  `docker build . -t node-app-todo`
    3.  `docker run --name node-todo-container -d -p 8000:8000 node-app-todo`
        1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/87b60d018b5200263321c24d2f098ebcc5e376a63a5c8ffd.png)
9.  **Update something and commit on github repo.**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/76ff94b945d4a827c0e9246e36f712572e420ac3ec3656e6.png)
10.  **The webhook triggered and the project started building automatically.**  
    1\. ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/1133ec4c2a3b20c3fc2d11afb1314a807292cbf34246b688.png)
11.  **Project success.**  
    1\. ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/61902a1fedcc60387ba86d32e95f05a979e4bf84d2a896d1.png)

<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>

---


## With docker-compose

1.  **Create a docker compose file**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/2a6e5bfa654cb48f3a61b8fb89c20f27311b2e6ce94f1c16.png)
2.  **Update the shell script to build & run, then save the project.**
    1.  `docker-compose down`
    2.  `docker-compose up -d --no-dep --build web`![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/010fb4b22195090be213ae30f87ab30a616b0fefcc8ea7c6.png)
3.  **Update something and commit on repo.**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/3e7191b3b6b7e48d693e236d864f5b593bbcf5b9897856bc.png)
4.  The webhook triggered and the project started building.
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/10b64169e27a1b9d7a8905832bbfdf66a2818095fe2d36a3.png)
5.  **Project success.**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/22e222e24581d8a1be7cf6f64b0f1fe09c85eacadcad07db.png)
6.  **Project output:**
    1.  ![](https://33333.cdn.cke-cs.com/kSW7V9NHUXugvhoQeFaf/images/8b760bd26fd20f4fc8673949f8f870cef766e5de369be63f.png)

<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>

---


# Roadmap

See the [open issues](https://github.com/neelsoni26/node-todo-cicd/issues) for a list of proposed features (and known issues).

<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>

# Contributing

Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request
  
<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>

# Contact

Neel Soni - [@sonineelp](https://twitter.com/sonineelp) - [sonineep@gmail.com](mailto:sonineep@gmail.com) - [https://www.linkedin.com/in/sonineelp](https://www.linkedin.com/in/sonineelp) 

Project Link: [https://github.com/neelsoni26/node-todo-cicd/](https://github.com/neelsoni26/node-todo-cicd/)

<div style="text-align: right">
  <a href="https://github.com/neelsoni26/node-todo-cicd/#readme">(back to top)</a>
</div>
