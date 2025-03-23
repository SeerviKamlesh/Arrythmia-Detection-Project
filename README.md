Detection of Cardiac Arrhythmia by Analysis of ECG Signal using Convolutional Neural Network
Overview:
Cardiac arrhythmias pose a significant health risk and require accurate detection for proper diagnosis and treatment. This project implements an advanced methodology for detecting cardiac abnormalities in ECG signals using a Convolutional Neural Network (CNN). The proposed system enhances detection accuracy through advanced signal processing techniques and machine learning-based classification.
How It Works
1.ECG Signal Acquisition: The system captures ECG signals from electrodes placed on a patient's body.
2.Signal Preprocessing: Filtering techniques such as Bandpass Filtering (BPF) and Daubechies Wavelet Decomposition (DBB) are applied to remove noise.
3.Feature Extraction: Features are extracted using Gray-Level Co-occurrence Matrix (GLCM) analysis and QRS wavelet decomposition.
4.Classification using CNN: The extracted features are fed into a CNN classifier that learns patterns and classifies normal and abnormal signals.
5.Real-time Decesion Support The system provides immediate feedback on detected cardiac anomalies.

Comparison: Existing vs. Proposed Method

Existing Method (Old Approach):
1.Uses Support Vector Machine (SVM) as the classification model.
2.Feature extraction is done using Principal Component Analysis (PCA) and Haar Wavelet decomposition.
3.Basic filtering techniques are applied for noise removal.
4.The system is semi-automated, requiring human intervention for classification.
5.Lacks real-time decision support, making it less effective for immediate diagnosis.

Proposed Method (New Approach):
1.Uses Convolutional Neural Network (CNN) for classification, improving accuracy.
2.Feature extraction is enhanced with Daubechies Wavelet Decomposition (DBB) and Gray-Level Co-occurrence Matrix (GLCM) analysis.
3.Advanced Bandpass Filtering (BPF) techniques are used to remove noise more effectively.
4.The system is fully automated, eliminating the need for manual classification.
5.Provides real-time decision support, enabling faster and more accurate diagnoses.

Advantages of the Proposed System:
Improved accuracy and sensitivity in detecting cardiac arrhythmias.
Real-time decision support for healthcare professionals.
Fully automated system requiring minimal manual intervention.
Scalable for deployment in various healthcare settings.
Technologies Used

Technologies Used:
Programming Language: MATLAB
Machine Learning Framework: CNN
Signal Processing Techniques: Wavelet Decomposition, Feature Extraction (GLCM)

Conclusion
The proposed system outperforms the traditional method by leveraging deep learning techniques for ECG classification. It provides a reliable, automated, and efficient approach for detecting cardiac arrhythmias, ultimately improving patient outcomes in cardiovascular healthcare.






