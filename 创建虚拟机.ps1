# �½������.ps1

function Step1 { 
echo `0
echo `0
echo `0
echo `0
$VMName = read-host "�����������"
echo `0
#�����������ȫ����
#Copy-Item "E:\Virtual Hard Disks\2022-ģ��.vhdx" "E:\Virtual Hard Disks\$VMName.vhdx"
#��������ǲ��츴��
New-VHD -ParentPath "E:\Virtual Hard Disks\2022-ģ��.vhdx" -Path "E:\Virtual Hard Disks\$VMName.vhdx" -Differencing
$Switch = read-host "ʹ�õĽ�����"
echo `0
$CPUCount = read-host "CPU�߳���"

New-VM -Name $VMName -MemoryStartupBytes 1.5GB -BootDevice VHD -VHDPath "E:\Virtual Hard Disks\$VMName.vhdx" -Path E:\Hyper-V\ -Generation 2 -Switch $Switch

Get-VM $VMName | Set-VMProcessor -Count $CPUCount

Get-VM $VMName | Set-VMMemory -DynamicMemoryEnabled $True -MaximumBytes 8GB -MinimumBytes 512MB -StartupBytes 1600MB -Buffer 5

Set-VM $VMName -CheckpointType Disabled

Start-VM -Name $VMName

Clear

Step1 
} 
switch(1)
{
    1{Step1}
}