#!/bin/bash

#Go to the control node. Run the commands below

ssh-keygen -t rsa
ssh-agent bash
ssh-add ~/.ssh/id_rsa

ssh-copy-id -i ~/.ssh/id_rsa.pub <USER>@<AGENT IP>

type C:\Users\eacer\.ssh\id_rsa.pub | <USER>@<AGENT IP> "cat >> .ssh/authorized_keys"