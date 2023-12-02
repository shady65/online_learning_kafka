# online_learning_kafka
mplement a binary classifier aiming at predicting data
exfiltration via DNS. In this exercise there will be two tasks graded individually. You are
expected to implement two predictive modeling solutions: the static model, and another
solution that adapts through time.
For both problems you will have 2 independent datasets, that should be treated accordingly:
•
•
A “static_dataset.csv” file which you can use to train a static model.
A “kafka_dataset.csv” file that you should treat as a data stream (local Kafka
Server) which will be used to evaluate the dynamic model.
Part I (Static Model):
Perform the following analysis and steps to your
data and your model:
1. Data Analysis: Using the file called “static_dataset.csv”, check using plots and
statistical tools the distribution of each feature and the target variable, validate if
your dataset is imbalanced and if you have any type of data skewed pattern.
Justify all your findings with plots or graphs.
2. Feature engineering and data cleaning: Analyze the data inside the .csv file
(static_dataset.csv) and transform the variables that contain string values, so that
all of them can be used in the model. Check for missing values and categorical
values. Tip: you might find useful an embedding technique or hashing
3. Feature Filtering/Selection: Use at least two different statistical techniques to
evaluate which features are the best to train your model, give a final list of those
you will use and justify your answer based on the results obtained from your
analysis.
4. Model Training: Split the data using a method you find suitable and justify it.
Normalize your data and train the selected model. In this point it is crucial thatyou analyze which metrics and performance evaluation will be the best for your
model. Select two learning algorithms and provide a comparison of their metrics.
Select the one that shows the best performance to be reused on the second part.
5. Model evaluation: It will be enough to split your data into train and test to
justify the results of your model. Plot the performance metrics and perform a
critical analysis of them. Save your model for using it in the second part.
Part II (Dynamic Model):
The Chief of Cyber Security has read your report and the managing directors are
threatening with closing down our branch because even though your results were
outstanding, we are not using enough technological tools as they would like. In order to
fulfill the board’s requests our analysis team has proposed to make an alternative analysis
using Online Learning. The purpose of this second task will be to simulate a real-life
scenario of a constant data stream. Make predictions on the new data that arrives in real-
time and register the performance of two different models.
•
•
Static model – will be the same that you saved in the previous task, and it will not
change at all.
Dynamic model – At the beginning, this model will be the same as the static, loaded
from our previous task, you will then use windows of 1,000 observations and make
an analysis of whether or not, it is a good idea to retrain the model. If needed,
retrain and plot your results
For this task you will need to follow the next instructions:
1. Follow the instructions on the pdf called “setup_instructions.pdf”, and make sure to
install dockers, create the images, install Kafka and the dependencies.
2. Use the .csv file called “Kafka_dataset.csv” and use it according to the instructions
to deploy de producer’s task.
3. Load your .h5 (or other extension) model to the notebook
4. Make sure to create two models, one for the dynamic analysis and other for the
static analysis.
5. Run the consumer’s code and validate you are receiving the data stream.
6. Create the necessary code to append 1,000 observations of data streaming
information and use them as a window.
7. Evaluate the dynamic model’s performance and create a decision boundary to
retrain the model or keep it as is.
8. Evaluate the performance of each model on each window.
9. Use the necessary arrays to store the performance metrics you consider best to
evaluate the performance of both models and create a time-based plot comparing
both performances from both models.
10. Decide when it is better to retrain the model and justify why.
11. Describe your results and make a conclusion of whether the dynamic
implementation is better or not, compared to the traditional static model.

Installation instructions:
This assignment’s purpose is to introduce students to the basics of Online Learning by
comparing 2 different solutions.
•
•
Standard static ML model
ML model that adapts through time
To achieve the real time data delivery, you will be asked to use Kafka and Dockers to
simulate an independent server which will send information.
This exercise will make use of Apache Kafka which is a messaged based streaming
platform that operates with 3 main concepts:
•
•
•
Consumer
Producer
Server
We will be using APIs to create a communication bridge between the producer and the
consumer and make use of the information provided in real time. In this activity the
Producer will not be hosted using a cloud service, we will use containers (Dockers) to
simulate a remote server on the cloud, but having it running in our local computer.
If you want to know more about what Kafka is and how it works, we recommend these web
pages and these blogs [1-3]
Setup guide
For this activity we need to install the local Docker and Docker Compose programs on our
computers.
Please use the following link to download it just take into consideration your operative
system. https://docs.docker.com/get-docker/Once your installation is complete, you will have the docker’s desktop interface as shown
in the following image. It is not necessary to create an account or to perform any upgrade,
with the free version we will be able to complete the assignment.
Once it is fully installed download and unzip the folder provided that contains the scripts
and the .csv with the data.
Once unzipped in your computer, run one of the following files depending on your
operative system:
•
•
If you are using windows then run the docker_script.bat file
Otherwise run the docker_script.sh file on Linux/MacOS.
This file will create two docker images wurstmeister/kafka and wurstmeister/zookeeper.
For this activity you don’t have to worry about what they are or how they run, as everything
is already configured. At the end of the installation.
To validate that the container images were created successfully open Dockers and you
should see two images running like thisIf you have any inconvenience, you can open the file and run it line by line.
Now let’s make use of the Producer’s API to upload the stream of data into the server. This
step will automatically perform the partition and will store the information into the topic,
ready for the consumer to read it. Please open the .ipynb called
“dns_kafka_producer.ipynb”. Run all cells and wait for the information to be uploaded,
this file will install the necessary libraries in case you don’t have them already and create
the producer object with the topic and server’s configuration pointing to our docker images.
Finally it will read the CSV file and push all the data to the server into the specific topic.
This process will take approximately 10 minutes, so be patient, a conclusion message will
be displayed when the process is done and you are able to see inside a red strip the number
of rows already inserted; this time can vary depending on your machine. The last step in
this process will be to run the “DNS_Kafka Consumer.ipynb” which will set up the
configuration to read data from the Docker’s server and the data ingested by the Producer.Now you are ready to capture the data stream and start the data treatment for your model.
Good luck and have fun!
References:
1 https://kafka.apache.org/documentation.html
2 https://data-flair.training/blogs/apache-kafka-tutorial/
3 https://medium.com/big-data-engineering/hello-kafka-world-the-complete-guide-to-
kafka-with-docker-and-python-f788e2588cfc
