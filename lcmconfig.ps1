[DSCLocalConfigurationManager()]
configuration LCMConfig
{
    Node localhost
    {
        Settings
        {
            RefreshMode = 'Push'
            ConfigurationMode = ApplyAndAutoCorrect
        }
    }
}
LCMConfig
