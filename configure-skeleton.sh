#!/bin/bash
# 'return' when run as "source <script>" or ". <script>", 'exit' otherwise
[[ "$0" != "${BASH_SOURCE[0]}" ]] && safe_exit="return" || safe_exit="exit"

script_name=$(basename "$0")

ask_question(){
    # ask_question <question> <default>
    local ANSWER
    read -r -p "$1 ($2): " ANSWER
    echo "${ANSWER:-$2}"
}

confirm(){
    # confirm <question> (default = N)
    local ANSWER
    read -r -p "$1 (y/N): " -n 1 ANSWER
    echo " "
    [[ "$ANSWER" =~ ^[Yy]$ ]]
}

current_directory=$(pwd)
folder_name=$(basename "$current_directory")

vendor_name_unsanitized=$(ask_question "Vendor name" "$author_name")
package_name=$(ask_question "Package name" "$folder_name")
package_description=$(ask_question "Package description" "$package_name")

class_name=$(echo "$package_name" | sed 's/[-_]/ /g' | awk '{for(j=1;j<=NF;j++){ $j=toupper(substr($j,1,1)) substr($j,2) }}1' | sed 's/[[:space:]]//g')

class_name=$(ask_question "Class Name" "$class_name")

echo -e "Package: $package_name <$package_description>"
echo -e "Class Name: $class_name"

vendor_name="$(tr '[:lower:]' '[:upper:]' <<< ${vendor_name_unsanitized:0:1})${vendor_name_unsanitized:1}"
vendor_name_lowercase=`echo "$vendor_name_unsanitized" | tr '[:upper:]' '[:lower:]'`
package_name_underscore=`echo "-$package_name-" | tr '-' '_'`

echo
files=$(grep -E -r -l -i ":author|:vendor|:package|spatie|skeleton" --exclude-dir=vendor ./* ./.github/* | grep -v "$script_name")

echo "This script will replace the above values in all relevant files in the project directory."
if ! confirm "Modify files?" ; then
    $safe_exit 1
fi

echo

for file in $files ; do
    echo "Updating file $file"
    temp_file="$file.temp"
    < "$file" \
      sed "s/:vendor_name/$vendor_name_lowercase/g" \
    | sed "s/:package_name/$package_name/g" \
    | sed "s/Spatie/$vendor_name/g" \
    | sed "s/OriginalVendor/Spatie/g" \
    | sed "s/_skeleton_/$package_name_underscore/g" \
    | sed "s/skeleton/$package_name/g" \
    | sed "s/Skeleton/$class_name/g" \
    | sed "s/:package_description/$package_description/g" \
    | sed "/^\*\*Note:\*\* Run/d" \
    > "$temp_file"
    rm -f "$file"
    new_file=`echo $file | sed -e "s/Skeleton/${class_name}/g"`
    mv "$temp_file" "$new_file"
done

prefix="laravel-"
short_package_name=${package_name#"$prefix"}
mv "./config/skeleton.php" "./config/${short_package_name}.php"

if confirm "Execute composer install and phpunit test" ; then
    composer install && ./vendor/bin/phpunit
fi

if confirm 'Let this script delete itself (since you only need it once)?' ; then
    echo "Delete $0 !"
    rm -- "$0"
fi
