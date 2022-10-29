[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            RefreshMode = 'Push'
            ConfigurationMode = 'ApplyAndAutoCorrect'
        }
    }
}
LCMConfig -OutputPath .
Set-DSCLocalConfigurationManager -Path D:\a\win2019DSCHardened\win2019DSCHardened\LCMConfig
