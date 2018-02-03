while ($true)
{
    $a=Get-WmiObject -Class Sensor -Namespace "root\OpenHardwareMonitor" -filter "Name LIKE 'CPU Core%' and SensorType='Temperature'" | Sort-Object -Property @{Expression = "Name"; Descending = $False}
    $port= new-Object System.IO.Ports.SerialPort COM1,9600,None,8,one
    $port.open()
    $port.Write($a[0].Value.ToString('f0'))
    $port.Close()
    Echo $a[0].Value.ToString('f1')
    foreach ($obj in $a) {
        Echo $obj.Name
        Echo $obj.Value
        }
    Start-Sleep -Milliseconds 2000
}
    # Refister-Scheduled job
    #Register-ScheduledJob -Name "CPUtempArd" -FilePath "C:\Users\Denis\Desktop\WMI.ps1"
    #$T=New-JobTrigger -AtStartup -RepetitionInterval $INTERVAL -RepeatIndefinetely
    #$INTERVAL=New-TimeSpan -Seconds 3
    #BAD ATTEMPTS


    
    #'hidden' target : %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe -NoProfile -WindowStyle Hidden -file "C:\Users\Denis\Desktop\WMI_script\WMI.ps1"

    #RESULT
    # 1. Install OpenHardwareMonitor
    # 2. Run at startup (in settings)
    # 3. Run > %AppData%
    # 4. go to C:\Users\<YOURUSERNAME>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
    # 5. Add "hidden" shortcut there
    # 6. Reboot 









































