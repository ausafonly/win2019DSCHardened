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
LCMConfig -OutputPath D:\LCMConfig
Set-DSCLocalConfigurationManager -Path D:\LCMConfig
