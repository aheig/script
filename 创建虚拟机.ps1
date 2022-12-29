# 新建虚拟机.ps1

function Step1 { 
echo `0
echo `0
echo `0
echo `0
$VMName = read-host "输入虚拟机名"
echo `0
#下面这个是完全复制
#Copy-Item "E:\Virtual Hard Disks\2022-模板.vhdx" "E:\Virtual Hard Disks\$VMName.vhdx"
#下面这个是差异复制
New-VHD -ParentPath "E:\Virtual Hard Disks\2022-模板.vhdx" -Path "E:\Virtual Hard Disks\$VMName.vhdx" -Differencing
$Switch = read-host "使用的交换机"
echo `0
$CPUCount = read-host "CPU线程数"

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