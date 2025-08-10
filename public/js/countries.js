// Data mapping for countries
// This file makes the countryData object globally available.

window.countryData = {
    'USA': { name: 'UNITED STATES OF AMERICA', flag: '🇺🇸', symbol: '🔵', color: '#0078d0', code: 'us' },
    'BRA': { name: 'BRAZIL', flag: '🇧🇷', symbol: '🟢', color: '#198754', code: 'br' },
    'CAN': { name: 'CANADA', flag: '🇨🇦', symbol: '🔴', color: '#dc3545', code: 'ca' },
    'ITA': { name: 'ITALY', flag: '🇮🇹', symbol: '✳️', color: '#198754', code: 'it' },
    'ROM': { name: 'ROMANIA', flag: '🇷🇴', symbol: '🟡', color: '#ffc107', code: 'ro' },
    'CHN': { name: 'PEOPLE\'S REPUBLIC OF CHINA', flag: '🇨🇳', symbol: '🈴️', color: '#dc3545', code: 'cn' },
    'GBR': { name: 'GREAT BRITAIN', flag: '🇬🇧', symbol: '🟣', color: '#6f42c1', code: 'gb' },
    'FRA': { name: 'FRANCE', flag: '🇫🇷', symbol: '🔷️', color: '#0d6efd', code: 'fr' },
    'DEFAULT': { name: '', flag: '', symbol: '', color: '#6c757d', code: 'xx' } // Add empty code for default
};

// Função global para obter código do país
window.getCountryCode = function(countryCode) {
    if (!countryCode || typeof countryCode !== 'string') {
        return 'xx'; // Código padrão para países não reconhecidos
    }
    
    const country = window.countryData[countryCode.toUpperCase()];
    return country ? country.code : 'xx';
};