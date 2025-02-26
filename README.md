# neticrm-docker

This repository contains the Dockerfile for building a PHP-only Docker image designed specifically for use with the **neticrm-selfhost** repository.

## Purpose

This image provides the necessary PHP environment to run NetiCRM and is intended to be used in conjunction with the `neticrm-selfhost` repository, which handles the overall deployment and configuration of NetiCRM.  It is NOT a standalone NetiCRM instance.

## Usage

This image is a component within a larger deployment strategy defined by `neticrm-selfhost`. You will not directly use this image to run neticrm but instead use the `neticrm-selfhost` repository.

## Build

To build the image, run the following command from the root of this repository:

