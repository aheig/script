# �޸�����Ӳ��.ps1
echo `0
echo `0
echo `0
echo `0
$Lujing = read-host "�����޸�����·��"
echo `0
$Fupan = read-host "ָ������·��"
echo `0
function Step1 { 
echo `0
$FixVhd = read-host "��Ҫ�޸��Ĵ�����"
echo `0
# Set-VHD ���������·����������Ҫ�޸��Ĵ��̣��� -ParentPath "�������·������������̣�" �Cignoreidmismatch
Set-VHD ��$Lujing\$FixVhd\$FixVhd.vhdx�� -ParentPath "$Fupan" �Cignoreidmismatch
Clear

Step1 
} 
switch(1)
{
    1{Step1}
}