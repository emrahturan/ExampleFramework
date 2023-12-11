# ExampleFramework
Example of creating and using Framework with Swift.

## How to generate .xcframework file?
```console
cd ExampleFramework
sh build.sh
```

## build.sh file
You can use it in your own framework by changing the moduleName value.
```console
#!/bin/sh

# -------------- config --------------

# Uncomment for debugging
set -x

# Set bash script to exit immediately if any commands fail
set -e

moduleName="ExampleFramework"

iphoneosArchiveDirectoryPath="/$moduleName-iphoneos.xcarchive"
iphoneosArchiveDirectory="$( pwd; )$iphoneosArchiveDirectoryPath"

iphoneosArchiveDirectoryPath="/$moduleName-iphonesimulator.xcarchive"
iphoneosSimulatorDirectory="$( pwd; )$iphoneosArchiveDirectoryPath"

outputDirectory="$( pwd; )/$moduleName.xcframework"

## Cleanup
rm -rf $iphoneosArchiveDirectory
rm -rf $iphoneosSimulatorDirectory
rm -rf outputDirectory

# Archive
xcodebuild archive -scheme $moduleName \
     -archivePath $iphoneosArchiveDirectory \
     -sdk iphoneos \
     SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES
      
xcodebuild archive -scheme $moduleName \
     -archivePath $iphoneosSimulatorDirectory \
     -sdk iphonesimulator \
     SKIP_INSTALL=NO BUILD_LIBRARIES_FOR_DISTRIBUTION=YES

## XCFramework
xcodebuild -create-xcframework \
    -framework "$iphoneosArchiveDirectory/Products/Library/Frameworks/$moduleName.framework" \
    -framework "$iphoneosSimulatorDirectory/Products/Library/Frameworks/$moduleName.framework" \
    -output $outputDirectory

## Cleanup
rm -rf $iphoneosArchiveDirectory
rm -rf $iphoneosSimulatorDirectory
```
