import os

def lambda_handler(event, context):
    print("This code was written for Udacity AWS Architect nanodegree by {}".format(os.environ['authour']))
    print("Thanks for trying it out!")
    print("This is the event this was called with: {}".format(event))
    print("This is the conext this was called with: {}".format(context))
    goodbye = "I hope you have enjoyed this code being run from:\\n {} environment.\\n Pretty cool! - by {} ".format(os.environ['AWS_EXECUTION_ENV'], os.environ['authour'])
    return goodbye