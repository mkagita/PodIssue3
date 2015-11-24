

build()
{
appName="$1"
bundleId="$2"
provisionProfile="$3"
codesignId="$4"



CURRENT_DIR=$(PWD)

rm -rf $CURRENT_DIR/build

#xcodebuild \
#-workspace PodIssue.xcworkspace \
#-scheme "Pods-PodIssue" \
#-configuration Release \
#-sdk iphoneos \
#OBJROOT=$(PWD)/build \
#SYMROOT=$(PWD)/build \
#-derivedDataPath $CURRENT_DIR/build/derivedData \

xcodebuild  \
-workspace PodIssue.xcworkspace \
-scheme "PodIssue" \
-configuration Release \
-sdk iphoneos \
OBJROOT=$(PWD)/build \
SYMROOT=$(PWD)/build \
-derivedDataPath $CURRENT_DIR/build/derivedData \
PRODUCT_BUNDLE_IDENTIFIER=$bundleId \
PROVISIONING_PROFILE=$provisionProfile \
CODE_SIGN_IDENTITY="$codesignId" \
PRODUCT_NAME="$appName" \
APP_NAME="$appName" \
LIBRARY_SEARCH_PATHS="${CURRENT_DIR}/build/Release-iphoneos" \
archive -archivePath $CURRENT_DIR/build/${outputIpaFilename} \
|| exit 1


}

pod update



build \
'PodIssue' \
'<your bundle id>' \
'<provisioning id>' \
'<your code sign identity>'

