#!/bin/bash

rvm_out=$(echo rvm)
echo "$rvm_out"

if [ "$rvm_out" == "/cwd/bin/run.sh: line 3: rvm: command not found" ]
then
  echo "New Shell Container Detected. Installing Startup Packages."
  gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
  \curl -sSL https://get.rvm.io -o rvm.sh
  cat rvm.sh | bash -s stable --rails
  source /usr/local/rvm/scripts/rvm
  source /etc/profile.d/rvm.sh
  # sudo usermod -a -G rvm root
  rvm install 2.7.4
  rvm use 2.7.4
  gem install bundler -v 2.4.7
  gem install rails -v 7.0.2
  bundle install
  echo "Initialization Sequence Completed. Opening Command Line..."
else
  echo "Initialized Shell Container Detected. Opening Command Line..."
fi

/bin/bash