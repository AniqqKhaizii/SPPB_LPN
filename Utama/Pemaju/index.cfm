<cfinclude template="../includes/head.cfm">

<body>
    <div class="flex h-screen overflow-auto">
        <cfinclude template="../includes/sidebar.cfm">
            <div class="relative flex flex-1 flex-col overflow-y-auto overflow-x-hidden">
                <cfinclude template="../includes/header.cfm">
                <main class="bg-gradient-to-b from-gray-900 to-gray-200 min-h-screen lg:px-12 pt-32">
                    <cfinclude template="./index_i.cfm">
                </main>
            </div>
    </div>
</body>