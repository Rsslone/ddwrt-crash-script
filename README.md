The purpose of this script is simple crash handling of Entware Services, mainly AdGuardHome which for me crashes occasionally without any recovery method.

To use:

Copy paste the following in the terminal. This downloads the script and makes it executable.
```
cd /opt/etc/init.d/ && curl https://raw.githubusercontent.com/Rsslone/ddwrt-crash-script/refs/heads/main/check.sh -o check.sh && chmod +x check.sh
```

Next in DDWRT panel go to Administration > Management > Cron, enable it, then paste the following in the Additional Jobs box, then apply.
This will run the script every minute, if you want to change the frequency, edit the cron expression. You can use a tool such as > https://crontab.cronhub.io/
NOTE: you technically can run this to check whatever service you want, just replace the "AdGuardHome" with the service name to check.

```
*/1 * * * * sh /opt/etc/init.d/check.sh AdGuardHome >> /opt/tmp/AdGuardHomeCheck.log 2>&1
```

That should be it, but if you want to test to see it working yourself, you can stop the service, wait a minute for the script to run, then check the logs or load AGH's webpage to prove its back up.

```
/opt/etc/init.d/rc.unslung stop
/opt/etc/init.d/rc.unslung check
cat /opt/tmp/AdGuardHomeCheck.log
```
