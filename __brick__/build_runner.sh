#!/bin/bash

# Build script for Flutter/Dart code generation
# This script runs build_runner with delete-conflicting-outputs flag

echo "🔄 Running build_runner with delete-conflicting-outputs..."

# Run build_runner with delete-conflicting-outputs flag
dart run build_runner build --delete-conflicting-outputs

# Check if the command was successful
if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully!"
else
    echo "❌ Build failed!"
    exit 1
fi
