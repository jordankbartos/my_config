echo "Copying vimrc --> ~/.vimrc..."
cp ./vimrc ~/.vimrc
echo $?

echo "Copying bashrc --> ~/.bashrc..."
cp ./bashrc ~/.bashrc
echo $?

echo "configure git..."
git config --global pull.ff only
echo $?

bash
