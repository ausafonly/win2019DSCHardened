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
Set-DSCLocalConfigurationManager -Path .
