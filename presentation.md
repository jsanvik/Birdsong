# INSERT WITTY TITLE HERE
## With a more decriptive subtitle
REMEMBER: "All killer, no filler"
### Questions
- Can we accurately predict song type choice in Adelaide's Warblers based on its neighbours' songs?
- Does identity play a significant role in song-type matching, or just song types?
- Can we detect higher-order dependencies in song-type matching behaviour?
- What else can we infer from these models?

## Background

Understanding the problem
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
- Three neighbourhoods of up to six individuals
- We decided to focus on the North neighbourhood because

## Machine Learning
- What is Machine Learning?
    - This is an example of a supervised classification problem
- Why Machine Learning?
    - Prediction
        - A discussion on “accuracy” metrics: sensitivity, specificity, precision, recall
            - We care most about accuracy and recall here
        - “Baseline classifier” accuracy (if we always predict majority)
    - Inferrence
- Train / Test sets
- Hyperparameter Tuning
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
David heard me say lots: "It's not what type of model, it's how we present it the data"
### Initial Models - Each Individual's N last song type as inputs
Show each model approach and iterative improvement  
- Don't show each tiny step, only major changes  
For decision trees, show tree  
For random forests, show feature importance graph
For all models, show inputs  
For all models, show confusion matrix
    - Consider showing accuracy, sensitivity, specificity for specific song types
For each model, specify r package, command, engine, and arguments
#### `does_it_match` K-nearest neighbours binary classifier
#### `does_it_match` Decision Tree binary classifier
#### `does_it_match` Random Forest binary classifier

### `UST` Decision Tree Classifier
- First splitting attribute is `M1_1_last_UST`, which matches earlier research
### `UST` Random Forest Tree Classifier
- Feature with highest importance is `M1_1_last_UST`, which matches earlier research
### `UST` Random Forest Tree Classifier (Including 2nd-last songs)
- Slightly more accurate, but not by much
- Look at feature importance more closely here
### `UST` Random Forest Tree Classifier (Including 2nd and 3rd-last songs)
- Not much of an improvement over 2nd-last UST
### `UST` Random Forest Tree Classifier (Centre Neighbourhood) (Including 2nd-last songs)
- Notably, M2_1_last_UST is the most important splitting attribute, which again matches earlier research.  



## Next Approach - What song types has focal male heard since last song? as inputs
### Slide on Data preprocessing  
David heard me say lots: "It's not what type of model, it's how we present it the data". We hit a roadblock with the above approach, so we asked ourselves how else we could restructure the data.




Two theories:
Song-type matching is is not a higher-order dependency
If this is the case, we should be able to build a pretty good model by only looking at the last song type
Song-type matching is a higher-order dependency
If this is the case, the best models will include data from further back, or aggregations of data further back