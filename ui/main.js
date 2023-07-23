$(function () {
    function display(bool) {
        if(bool) {
            $("#container").show()
        } else {
            $("#container").hide()
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        const zod = event.data

        if(zod.mode === "editor_travail") {
            if (zod.type === "ui") {
                if (zod.status) {
                    const editor_travail = document.querySelectorAll(".editor_travail")
                    editor_travail.forEach((e) => {
                        e.style.display = "inline-block"
                    })

                    const accept = document.getElementById("accept")
                    accept.innerText = "Envoyer"
                    const onClickAccept = () =>{
                        const compagny = document.getElementById("job")
                        const owner = document.getElementById("owner")
                        const candidat = document.getElementById("candidat")
                        const birthday = document.getElementById("birthday")
                        const home = document.getElementById("home")
                        const functions = document.getElementById("functions")
                        const role = document.getElementById("role")
                        const where = document.getElementById("where")

                        const accept = document.getElementById("accept")
                        accept.removeEventListener("click", onClickAccept)
                    
                        $.post('http://krp_contracts/accept', JSON.stringify({
                            job_label: zod.data.job_label,
                            job_name: zod.data.job_name,
                            compagny: compagny.value,
                            owner: owner.value,
                            candidat: candidat.value,
                            birthday: birthday.value,
                            home: home.value,
                            functions: functions.value,
                            role: role.value,
                            where: where.value
                        }));
                    }
                    accept.addEventListener("click", onClickAccept)

                    const refuse = document.getElementById("refuse")
                    refuse.innerText = "Quitter"
                    const onClickrefuse = () => {
                        const refuse = document.getElementById("refuse") 
                        refuse.removeEventListener("click", onClickrefuse)
                        $.post('http://krp_contracts/refuse', JSON.stringify({}));
                    }

                    refuse.addEventListener("click", onClickrefuse)

                    display(true)
                } else {
                    const editor_travail = document.querySelectorAll(".editor_travail")
                    editor_travail.forEach((e) => {
                        e.style.display = "none"
                    })

                    display(false)
                }
            }
        } 
        
        else if(zod.mode === "contract_travail") {
            if (zod.type === "ui") {
                if (zod.status) {
                    const enterprise = document.getElementById("enterprise")
                    enterprise.innerText = zod.data.compagny

                    const employer_name = document.getElementById("employer_name")
                    employer_name.innerText = zod.data.owner

                    const candidat_name = document.getElementById("candidat_name")
                    candidat_name.innerText = zod.data.candidat

                    const candidat_birthday = document.getElementById("candidat_birthday")
                    candidat_birthday.innerText = zod.data.birthday

                    const candidat_address = document.getElementById("candidat_address")
                    candidat_address.innerText = zod.data.home

                    const candidat_poste = document.getElementById("candidat_poste")
                    candidat_poste.innerText = zod.data.functions

                    const candidat_responsabilité = document.getElementById("candidat_responsabilité")
                    candidat_responsabilité.innerText = zod.data.role

                    const entreprise_address = document.getElementById("entreprise_address")
                    entreprise_address.innerText = zod.data.where

                    const name_p1 = document.getElementById("name-p1")
                    name_p1.innerText = zod.data.candidat

                    const name_p2 = document.getElementById("name-p2")
                    name_p2.innerText = zod.data.owner

                    const contract_travail = document.querySelectorAll(".contract_travail")
                    contract_travail.forEach((e) => {
                        e.style.display = "inline-block"
                    })

                    const accept = document.getElementById("accept")
                    accept.innerText = "Accepter"
                    const onClickAccept = () => {
                        const accept = document.getElementById("accept")
                        accept.removeEventListener("click", onClickAccept)

                        $.post('http://krp_contracts/accept', JSON.stringify({
                            haveAccept: "yes",
                            job_label: zod.data.job_label,
                            job_name: zod.data.job_name
                        }));
                    }

                    accept.addEventListener("click", onClickAccept)

                    const refuse = document.getElementById("refuse")
                    refuse.innerText = "Refuser"
                    const onClickRefuse = () => {
                        const refuse = document.getElementById("refuse")
                        refuse.removeEventListener("click", onClickRefuse)
                        $.post('http://krp_contracts/refuse', JSON.stringify({
                            haveAccept: "no"
                        }));
                    }

                    refuse.addEventListener("click", onClickRefuse)

                    display(true)
                } else {
                    const contract_travail = document.querySelectorAll(".contract_travail")
                    contract_travail.forEach((e) => {
                        e.style.display = "none"
                    })
                    
                    display(false)
                }
            }
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which === 27) {
            $.post('http://krp_contracts/exit', JSON.stringify({}));
            return true
        }
    }

    $("#exit").click(() => {
        $.post('http://krp_contracts/exit', JSON.stringify({}));
    })

    $("#discord").click(() => {
        const discord = "https://discord.gg/t3ZxqJJAAH"

        const copyToClipboard = (str) => {
            const el = document.createElement('textarea')
            el.value = str
            document.body.appendChild(el)
            el.select()
            document.execCommand('copy')
            document.body.removeChild(el)
        }

        copyToClipboard(discord)

        $.post('http://krp_contracts/discord', JSON.stringify({}));
    })
})