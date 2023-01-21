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


## Lab 5 - Spark

- Installing spark using the tutorial from https://phoenixnap.com/kb/install-spark-on-windows-10


