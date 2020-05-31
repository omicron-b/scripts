#!/bin/bash
lxc start apps || true
lxc exec apps -- sudo --user ubuntu --login google-chrome-stable
