#!/usr/bin/env bash
FSWEB=$(dpkg -l | grep fswebcam)
if [ -z "FSWEB" ]; then
	apt install fswebcam -y
	apt install figlet -y
fi
	clear
figlet AVA-ROSE
figlet WEBCAM
SIZES=('320x240' '640x480' '1024x768')
echo''
echo "1. ${SIZES[0]}"
echo "2. ${SIZES[1]}"
echo "3. ${SIZES[2]}"
echo''
echo -n "SELECIONE A RESOLUÇÃO > "; read -n 1 esc
echo ''
echo -n "QUANTOS FRAMES ? (0/9) > "; read -n 1 frames
echo ''
echo -n "QUANTOS SEGUNDOS DE DELAY ? > "; read -n 1 Delay
echo ''
F=0
INDEX=$(($esc - 1))
RES=$(echo ${SIZES[$INDEX]})
	while [[ $F < $frames ]]; do
	F=$(($F + 1))
	IMAGE="$(date +"%Y-%m-%d_%H:%M:%S")($F).jpg"
	fswebcam -r $RES $IMAGE
	if [[ $Delay > 0 ]]; then
	sleep $Delay
 fi
done
figlet AVA-ROSE

