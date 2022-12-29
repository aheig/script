# 修复虚拟硬盘.ps1
echo `0
echo `0
echo `0
echo `0
$Lujing = read-host "输入修复磁盘路径"
echo `0
$Fupan = read-host "指定父盘路径"
echo `0
function Step1 { 
echo `0
$FixVhd = read-host "需要修复的磁盘名"
echo `0
# Set-VHD “检查点磁盘路径（或者需要修复的磁盘）” -ParentPath "虚拟磁盘路径（或父虚拟磁盘）" –ignoreidmismatch
Set-VHD “$Lujing\$FixVhd\$FixVhd.vhdx” -ParentPath "$Fupan" –ignoreidmismatch
Clear

Step1 
} 
switch(1)
{
    1{Step1}
}