# Gen6D Setup Tutorial :rocket:

Welcome to the Gen6D setup tutorial! :raised_hands: This guide will walk you through the process of setting up the Scitas Izar environment to run Gen6D.

## Step-by-Step Setup Instructions :clipboard:

### Step 1: Request Permission :email:

To begin, send an email requesting access to the Scitas servers. Unfortunately, detailed instructions can't be provided here, as access privileges vary.

### Step 2: Clone Gen6D Repository :clipboard:

Clone this repository:

```bash
git clone git@github.com:JCHAVEROT/Gen6D.git
```

### Step 3: Pretrained Model Setup :floppy_disk:

Follow the instructions provided by the Gen6D authors to set up the model in the `README.md` file from [this link](https://github.com/liuyuan-pal/Gen6D).

### Step 4: Connect to EPFL Network :computer:

Ensure you're connected to the EPFL internet network in person or via the EPFL VPN.

### Step 5: Transfer Files to Scitas Izar :arrow_right_hook:

Transfer the Gen6D files to your Scitas Izar session using the `rsync` command:

```bash
rsync -azP <your/path/to/Gen6D> <username>@izar.epfl.ch:~/
```

### Step 6: Create Virtual Environment :gear:

Create a virtual environment on your Scitas Izar session using the instructions provided [here](https://scitas-doc.epfl.ch/user-guide/software/python/python-venv/). Don't forget to activate it!

### Step 7: Install Dependencies :package:

Install all the necessary libraries for Gen6D to run, listed in the `requirements.txt` file, except for openmpi, py-torch, py-torchvision, and cuda.

### Step 8: Add your data :floppy_disk:

You can find a compressed `zip` file containing well-organized SpaceCraft images as a template for testing purposes on [this link](CURRENTLY BEING UPLOAD).

### Step 9: Submit Job :rocket:

Compose your `execute.sh` file using the provided template and submit the job:

```bash
sbatch execute.sh
```

### Step 10: Retrieve Results :inbox_tray:

Find the pose estimation results in the `/Gen6D/data` folder. Retrieve them using the following commands:

```bash
rsync -azP <username>@izar.epfl.ch:~/Gen6D/data/performance.log <your/folder>
rsync -azP <username>@izar.epfl.ch:~/Gen6D/data/eval <your/folder>
rsync -azP <username>@izar.epfl.ch:~/Gen6D/data/vis_inter <your/folder>
rsync -azP <username>@izar.epfl.ch:~/Gen6D/data/vis_final <your/folder>
```

### Pro Tip :bulb:

Once the job is submitted, access the console log in the `scratch/izar/<username>` folder using:

```bash
cd && cd /scratch/izar/<username>
```

## Additional Resources :books:

For more commands to control your job, refer to the [Scitas Documentation](https://scitas-doc.epfl.ch/user-guide/using-clusters/running-jobs/).


---

`README.md` file generated by GPT from LaTeX source code.