#include <iostream>
#include <windows.h>
int main()
{
	int array[] = { 99, 10, 34, 9, 32, 12, 99, 221, 3, 78
};
	int count = 0;
	for (int elem : array) {
		if ((~(elem >> 1) & 1) & ~((elem >> 5) & 1)) {
			count++;
		};
	};

	wchar_t str[16];
	_itow_s(count, str, 10);
	MessageBox(0, str, L"c++", MB_OK);
}