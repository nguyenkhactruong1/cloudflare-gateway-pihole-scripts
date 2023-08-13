#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/filters/filters.min.txt
  https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext&_=2
  https://curbengh.github.io/malware-filter/urlhaus-filter-online.txt
  https://ublockorigin.pages.dev/filters/badware.txt
  https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/filters/privacy.min.txt
  https://ublockorigin.pages.dev/filters/quick-fixes.txt
  https://ublockorigin.pages.dev/filters/unbreak.min.txt
  https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/thirdparties/easylist.txt
  https://ublockorigin.pages.dev/thirdparties/easyprivacy.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts
  https://raw.githubusercontent.com/yokoffing/filterlists/main/enhanced_site_protection.txt
  https://raw.githubusercontent.com/LennyFox/Blocklists/master/Block_non_latin_TLDs.txt
  https://raw.githubusercontent.com/nmtrung/FMSF-2.0/master/fmsf_2.0.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/wildcard.txt
  https://abpvn.com/filter/abpvn-7KqAID.txt
  https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_adblock.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_gambling.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_privacy.txt
  https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.Risk/hosts
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt
  https://adaway.org/hosts.txt
  https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
