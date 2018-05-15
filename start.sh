#!/bin/bash
fallocate -l $TEST_SIZE /usr/src/app/test_file
ruby /usr/src/app/s3.rb