# Usage

This file covers details of step 2, 3, 4 in the original README.md.

## Installation

```
pip install -r requirements.txt
```

## Download 
```
mkdir ac_dc
```
All downloaded files stored under `ac_dc`

### Fasttext model
```
wget https://dl.fbaipublicfiles.com/fasttext/supervised-models/lid.176.bin -P ac_dc
```

### Sentencepiece & KenLM

modify `language_id.py` to choose what languages you want to download

```
python3 download_sentencepiece_kenlm_models.py \
    --output_dir_path ac_dc
```


## Choose the filtering parameters [Optional]
This script will open a web page with some data visualization that can help choose parameter.
```
streamlit run visualization/visualization.py
```


## Run the filtering
* Run:
    ```
    bash run_filter.sh
    ```

* Since our dataset are text files and are separated by "\n\n" between documents, I did some changes to the code: 
    ``` 
    # original bloom implementation to load OSCAR
    dataset = load_dataset(
         args.dataset_name,
         args.config_name,
         data_files=args.data_files,
         split=args.split,
         use_auth_token=True,
    )

    # modified 
    dataset = load_dataset("text", data_files=["test.txt"])
    dataset = dataset.filter(lambda d: len(d['text']) > 0)

    ```
* If you want to see some examples, then set `--print_examples` in `run_filter.sh` 
