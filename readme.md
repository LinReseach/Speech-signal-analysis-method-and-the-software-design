# 🎵 Speech Signal Analysis and Processing System

> **📖 Academic Project**: This is my bachelor graduation design project completed in 2017, showcasing the application of digital signal processing techniques in speech and music analysis.

## 🔍 Overview

This project implements a sophisticated speech signal processing system that combines classical digital signal processing techniques with modern separation algorithms. The primary focus is on separating singing voices from music accompaniment using RPCA methods, while providing comprehensive tools for audio analysis, filtering, and real-time visualization.

### Key Highlights
- 🎤 **Monaural voice separation** using RPCA algorithm
- 🎛️ **Real-time audio processing** with GUI interface
- 📊 **Advanced visualization** tools (spectrograms, 3D plots)
- 🔧 **Multiple filter designs** (FIR, IIR, adaptive)
- 🎚️ **Built-in equalizer** with real-time adjustment

## ✨ Features

### 🎵 Audio Processing
- **File Support**: WAV, MP3 formats
- **Real-time Playback**: Play, pause, stop, resume controls
- **Voice Separation**: RPCA-based singing voice extraction
- **Noise Processing**: Various noise addition and filtering
- **Adaptive Filtering**: LMS algorithm implementation

### 📈 Analysis Tools
- **Time Domain Analysis**: Waveform visualization
- **Frequency Analysis**: FFT-based spectrum display
- **Time-Frequency Analysis**: STFT spectrograms
- **3D Visualization**: Interactive 3D time-frequency plots
- **Performance Metrics**: SDR, SIR, SAR evaluation

### 🎛️ Filter Design
- **Classical Filters**:
 - Butterworth (low/high/band-pass/stop)
 - Chebyshev Type I & II
 - FIR with window functions (Hamming, Hanning, Kaiser, Chebyshev)
- **Adaptive Filters**:
 - LMS adaptive filtering
 - Real-time parameter adjustment

### 🖥️ GUI Interface
- User-friendly MATLAB GUIDE interface
- Audio player with built-in equalizer
- Interactive parameter controls
- Real-time visualization updates
- File management system



## 📁 File Structure

| File | Description |
|------|-------------|
| 📄 `LMS.m` | LMS adaptive filter implementation |
| 📄 `myaudioplayer.m` | Audio player GUI with equalizer |
| 📄 `rpca_mask_fun.m` | RPCA separation algorithm core |
| 📄 `stft.m` | Short-Time Fourier Transform |
| 📄 `stft3d.m` | 3D STFT visualization |
| 📄 `istft.m` | Inverse STFT reconstruction |
| 📄 `SVS.m` | Singing Voice Separation wrapper |
| 📄 `voice_signal_processing.m` | Main GUI application |
| 📄 `add_noisefile.m` | Noise addition utilities |
| 📄 `shiyan.m` | Experimental scripts and tests |
| 🎥 `instruction in video.wmv` | A comprehensive video tutorial demonstrating GUI operations |
| 📄 `README.md` | This file |
