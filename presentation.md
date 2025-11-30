# INSERT TITLE HERE
## With a more decriptive subtitle
REMEMBER: "All killer, no filler"
### Questions
- Can we accurately predict song type choice in Adelaide's Warblers based on its neighbours' songs?
- Does identity play a significant role in song-type matching, or just song types?
- Can we detect higher-order dependencies in song-type matching behaviour?
- What else can we infer from these models?

## Background

Adelaide’s Warblers
The Dawn Chorus  

### What do we already know about song-type matching?
- What is Song-Type Matching?
- Sharing Declines with distance
- More likely to match songs sung by nearby neighbours, and song types they had recently sung
- Two birds must share the same song type in their repertoires to song-type match
- Collective themes

### The Data
Context
- During breeding season
- During Dawn Chorus
- Three neighbourhoods of up to six males
- We decided to focus on the North neighbourhood due to data quantity and quality

## Machine Learning
- What is Machine Learning?
    - This is an example of a supervised classification problem
- Why Machine Learning?
    - Prediction
    - Inferrence
- Train / Test sets
- Hyperparameter Tuning and Cross-Validation
- Scaling & Centering data

### ML model architectures
NOTE: don't spend much time talking about models we didn't use
- We chose non-parametric, supervised classification models
- K-nearest neighbours
    - Better for meaningful numerical predictors, not really applicable here
- Artificial Neural Networks and Deep Learning
    - More complex, and require large quantities of data
- Decision Trees & Random Forest
    - Seemed most suitable to our problem, and initial results looked promising
    - How do decision trees choose best splitting attributes and points?
    - How does a random forest differ from an ensemble of decision trees?  

When discussing architectures, consider discussing:  
- Prediction accuracy
- Training / inference speed
- Robustness (handling noise and missing values)
- Scalability: handling small -> large datasets
- Interpretability


## Models

Show each model approach and iterative improvement  
- Don't show each tiny step, only major changes  
For decision trees, show tree  
For random forests, show feature importance graph
For all models, show inputs  
For all models, show confusion matrix
    - Consider showing accuracy, sensitivity, specificity for specific song types
For each model, specify R package, command, engine, and arguments

As mentioned before, we care about prediction and inferrence  
Prediction:  
- A discussion on “accuracy” metrics: sensitivity, specificity, precision, recall
    - We care most about accuracy and recall here
    - “Baseline classifier” accuracy (if we always predict majority)
Inferrence:  
- We can analyze models to see what most important attributes for prediction are
- 

David heard me say lots: "It's not what type of model, it's how we present it the data"  


### Initial Models - Each Individual's N last song type as inputs
Baseline Classifier Accuracy: 16.22% (Song Type 9)  
#### Slide on data prepraration
- Each row was a song by focal male, columns were most recent song type from each of focal male's neighbours
#### `does_it_match` K-nearest neighbours binary classifier
- K-nearest neighbours not the right model type for this problem (doesn't handle categorical attributes well)
#### `does_it_match` Decision Tree binary classifier
- Show decision tree
#### `does_it_match` Random Forest binary classifier
- Show random forest results

### `UST` Decision Tree Classifier
- First splitting attribute is `M1_1_last_UST`, which matches earlier research
### `UST` Random Forest Classifier
- Feature with highest importance is `M1_1_last_UST`, which matches earlier research
### `UST` Random Forest Classifier (Including 2nd-last songs)
- Slightly more accurate, but not by much
- Look at feature importance more closely here
### `UST` Random Forest Classifier (Including 2nd and 3rd-last songs)
- Not much of an improvement over 2nd-last UST
### `UST` Random Forest Classifier (Centre Neighbourhood) (Including 2nd-last songs)
- Notably, M2_1_last_UST is the most important splitting attribute, which again matches earlier research.  



## Next Approach - What song types has focal male heard since last song? as inputs
### Slide on Data preprocessing  
David heard me say lots: "It's not what type of model, it's how we present it the data". We hit a roadblock with the above approach, so we asked ourselves how else we could restructure the data.  

Baseline Classifier Accuracy: 15.88% (Song Type 3)  

#### 13 `UST` Decision Tree Classifier (Song Frequencies and `time_since_M1_1_last_UST`)
- Show decision Tree
#### 14 `UST` Random Forest Classifier (Song Frequencies and `time_since_M1_1_last_UST`)

#### 15 `UST` Random Forest Classifier (Just Song Frequencies)
- Our best model yet (~26% Accuracy)


## Findings
- `time_since_m1_1_last_UST` was the m

## Next Steps
- Try other model architectures (Neural Networks)
- Other ways of formatting the data
- What else do you guys think we should look into?

## Anticipated Questions
- Which song types had the most errors? The least? Why?

Two theories:
Song-type matching is is not a higher-order dependency
If this is the case, we should be able to build a pretty good model by only looking at the last song type
Song-type matching is a higher-order dependency
If this is the case, the best models will include data from further back, or aggregations of data further back