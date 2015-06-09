#!/usr/bin/env bash
[[ `ls $(brew --prefix android)/build-tools -l | grep 22.0` ]] && exit 0

echo y | android update sdk --all --no-ui --force --filter android-21,android-22
echo y | android update sdk --all --no-ui --force --filter tools
echo y | android update sdk --all --no-ui --force --filter platform-tools
echo y | android update sdk --all --no-ui --force --filter build-tools-21.0.2,build-tools-21.1.2,build-tools-22.0.1
echo y | android update sdk --all --no-ui --force --filter source-21
echo y | android update sdk --all --no-ui --force --filter extra-android-m2repository
echo y | android update sdk --all --no-ui --force --filter extra-android-support
echo y | android update sdk --all --no-ui --force --filter extra-google-admob_ads_sdk
echo y | android update sdk --all --no-ui --force --filter extra-google-analytics_sdk_v2
echo y | android update sdk --all --no-ui --force --filter extra-google-gcm
echo y | android update sdk --all --no-ui --force --filter extra-google-google_play_services
echo y | android update sdk --all --no-ui --force --filter extra-google-google_play_services_froyo
echo y | android update sdk --all --no-ui --force --filter extra-google-m2repository
echo y | android update sdk --all --no-ui --force --filter extra-google-play_apk_expansion
echo y | android update sdk --all --no-ui --force --filter extra-google-play_billing
echo y | android update sdk --all --no-ui --force --filter extra-google-play_licensing
echo y | android update sdk --all --no-ui --force --filter extra-google-webdriver
echo y | android update sdk --all --no-ui --force --filter addon-google_apis-google-18
echo y | android update sdk --all --no-ui --force --filter addon-google_apis-google-19
echo y | android update sdk --all --no-ui --force --filter addon-google_apis-google-20
echo y | android update sdk --all --no-ui --force --filter addon-google_apis-google-21
echo y | android update sdk --all --no-ui --force --filter addon-google_apis-google-22

