# Basic NPM Module 

## NPM Module

NPM is a package manager for Node.js packages, or modules if you like.

www.npmjs.com hosts thousands of free packages to download and use.

The NPM program is installed on your computer when you install Node.js

## What is a Package?
A package in Node.js contains all the files you need for a module.

## How to add a Package:
 on the command line, in the root directory of your Node.js module, run **npm init**
 NPM creates a folder named "node_modules", where the package will be placed. All packages you install in the future will be placed in this folder.
 a package.json file will also be generated and placed in the current directory which holds the all dependencies.
 
## How to add any NPM Package:
Downloading a package is very easy.

Open the command line interface and tell NPM to download the package you want.

I want to download a package called "express":
<br />
C:\Users\Your Name>**npm install express**


## Using any installed NPM Package:
once the package is installed, it is ready to use.

Include the "express" package the same way you include any other module:
<br />
**var express = require('express');**


