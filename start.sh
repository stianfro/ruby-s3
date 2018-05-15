#!/bin/bash
fallocate -l $TEST_SIZE test_file
ruby s3.rb