# Loaded systems labs

## Our team (КІ-21МП)
- Дєрюгін Є.О
- Олійник Б.О
- Ярошенко О.Р

## Lab 1 - Docker

### Task_1 Steps

Starting from folder D:\IASA_loaded_systems 

- Getting to directory with 1st task - `cd lab1_Docker` -> `cd task_1`
- Starting the container - `docker-compose up`

![Task_1 Terminal](/images/task1-terminal.png)

### Task_1 Result
![Task_1 Result](/images/task1-result.png)

### Task_2 Steps
- Getting to directory with the 2nd task - `cd ..` -> `cd task_2`
- Starting the container - `docker-compose up`

![Task_2 Terminal](/images/task2-terminal.png)

### Task_2 Result
![Task_2 Result](/images/task2-result.png)

### Task_3 Steps
- Getting to directory with the 3rd task - `cd ..` -> `cd task_3`
- Starting the container - `docker-compose up`

![Task_3 Terminal](/images/task3-terminal.png)

### Task_3 Result
![Task_3 Result](/images/task3-result.png)

### Task_4 Steps
- Getting to directory with the 4th task - `cd ..` -> `cd task_4`
- Starting the container - `docker-compose up`

![Task_4 Terminal](/images/task4-terminal.png)

### Task_4 Result
![Task_4 Result1](/images/task4-result1.png)
![Task_4 Result2](/images/task4-result2.png)

### Task_5 Steps
- `cd ..` -> `cat results.txt`

## Lab 3 - MongoDB

- Getting to directory with the 3rd lab - `cd lab3_MongoDB`
- Login to Docker to avoid given error: "Error response from daemon: Get http://ipc/registry/access: context deadline exceeded (Client.Timeout exceeded while awaiting headers)" - `docker login`
- Starting the container - `docker-compose up -d`

    ![](/images/lab3-1.png)
    ![](/images/lab3-2.png)
    ![](/images/lab3-3.png)
    ![](/images/lab3-4.png)

Running containers
![](/images/lab3-5.png)

- Initialization config server and shards calling the commands in file init.sh - `sh init.sh`

    - Init config server: 

        ![](/images/lab3-6.png)

    - Init shard1: 

        ![](/images/lab3-7.png)

    - Init shard2: 

        ![](/images/lab3-8.png)

    - Init shard3: 

        ![](/images/lab3-9.png)

- Router initialization - `docker-compose exec router1 sh -c 'mongo < /scripts/init-router.js'`

    ![](/images/lab3-10.png)

    ![](/images/lab3-11.png)

- Generate rides data using London postcodes.csv (steps described in the generate-data Jupyter notebook). Result file: `rides.csv`

- Processing data - `sh process_data.sh`

    ![](/images/lab3-12.png)

- Checking - `ls -lh data`

    ![](/images/lab3-13.png)

- `docker-compose down -v --rmi all --remove-orphans` - Stopping containers. 
    - `-v` - removing volumes declared in volumes section in the docker-compose file
    - `--rmi` - removing images used by services 
    - `--remove-orphans` - removing containers for services, that r not defined in the docker-compose file

    ![](/images/lab3-14.png)

    ![](/images/lab3-15.png)


## Lab 4 - Hadoop
- `sample.txt` - input data 
- `ProcessUnits.java` - Java code
- `result.txt` - file with results of requests

- Step 1 - Creating directory foe compiled Java classes `mkdir units`

    ![](/images/lab4-1.png)

- Step 3 

    - `javac -classpath C:/hadoop/hadoop-core-1.2.1.jar -d units ProcessUnits.java`

        Result
        
        ![](/images/lab4-2.png)

    - `jar --create --file units.jar -C units/hadoop/ .`

        Result

        ![](/images/lab4-3.png)

- Step 4 - installing Hadoop 
    - Downloading Hadoop archive
    - Extract to C:\Program Files\Hadoop 
    - Creating environment variables 

        ![](/images/lab4-4.png)
        
        ![](/images//lab4-5.png)

- Step 5 - Starting Docker container with Hadoop

    ![](/images/lab4-6.png)

- Step 6 - `docker exec -it namenode bash`

- Step  7 - `hadoop fs -mkdir -p input_dir` -> `hadoop fs -ls`

    ![](/images/lab4-7.png)

- Step 8 - Add sample.txt file to input_dir

    - `docker cp D:/IASA_loaded_systems/lab4_Hadoop/sample.txt 940ecf081367:sample.txt`
    - `hadoop fs -put sample.txt input_dir`

        ![](/images/lab4-8.png)

- Step 9 - Add units.jar and ProcessUnits.java to docker container

    - `docker cp D:/IASA_loaded_systems/lab4_Hadoop/units.jar 940ecf081367:units.jar`
    - `docker cp D:/IASA_loaded_systems/lab4_Hadoop/ProcessUnits.java 940ecf081367:ProcessUnits.java`

- Step 10 (Accident). Because of ProcessUnits.java was compiled using JDK-19, there is troubles with compiling it inside docker container. That's why we gonna do following: 

    - `mkdir junits`

    - `cd junits`

    - `cp ../ProcessUnits.java ./ProcessUnits.java`

    - `javac ProcessUnits.java -cp $(hadoop classpath) -target 1.8`

    - `jar cvf junits.jar *`

    - `cd ..`

    - `cp ./junits/junits.jar .junits.jar`

- Step 11 - `hadoop jar junits.jar ProcessUnits input_dir output_dir`

    ![](/images/lab4-9.png)

    ![](/images/lab4-10.png)

- Step 12 - `hadoop fs -ls output_dir`

    ![](/images/lab4-11.png)

- Step 13 

    - `hadoop fs -cat output_dir/part-00000 > result.txt`
    - `docker cp 3e10b17f4ef4:result.txt D:/IASA_loaded_systems/lab4_Hadoop/data/result.txt`

    ![](/images/lab4-12.png)

- Step 14 - `docker-compose down`

## Lab 5 - Spark

**We decided to use Google Collab to do this lab, because the computing requires a lot of computing power and our computers are not powerful enough**
    
- Generate taxi traffic data using `faker_generate_traffic.ipynb` 

    Result is located in /lab5_Spark/data/rides.csv (we have no opportunity to load this to GitHub)

- Get statistic data using Pyspark. Code is located in `pyshark_map_reduce.ipynb`

    As the result we have this files in the `lab5_Spark/data` folder: 

    - `densest_traffic_by_hour.json` - Contains the most densest traffic timezone and amount of rides. 
    - `top_10_longest_text_comments.json` - Contains 10 longest text comments
    - `top_50_clients.json` - Contains 50 the most well-rated clients
    - `top_100_drivers.json` - Contains 100 the most well-rated drivers
    - `top_complaint_driver_category.json` - Contains the most frequent complaint category in driver rate category
    - `top_night_riders.json` - Contains 50 drivers, who did nights rides more than others
    - `top_praised_driver_category.json` - Contains the most frequent praise category in driver rate category
    - `worst_drivers.json` - Contains 100 the most worst-rated drivers



